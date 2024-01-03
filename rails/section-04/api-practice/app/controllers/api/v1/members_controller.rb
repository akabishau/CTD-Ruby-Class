class Api::V1::MembersController < ApplicationController
  include AuthenticationCheck

  before_action :is_user_logged_in
  before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  def index
    @members = Member.where(user_id: current_user.id)
    render json: { members: @members }
  end

  # GET /members/:id
  def show
    return unless check_access(@member)

    render json: @member
  end

  # POST /members
  def create
    @member = Member.new(member_params)
    @member.user_id = current_user.id
    if @member.save
      render json: @member, status: :created
    else
      render json: {
               error: "Unable to create member: #{@member.errors.full_messages.to_sentence}"
             },
             status: :bad_request
    end
  end

  # PUT /members/:id
  def update
    return unless check_access(@member)

    if @member.update(member_params)
      render json: {
               message: "Member was successfully updated.",
               member: @member
             },
             status: :ok
    else
      render json: {
               error: "Unable to update member: #{@member.errors.full_messages.to_sentence}"
             },
             status: :unprocessable_entity
    end
  end

  # DELETE /members/:id
  def destroy
    if check_access(@member)
      @member.destroy
      render json: { message: "Member record successfully deleted." },
             status: :ok
    else
      render json: { error: "Deletion failed." },
             status: :unprocessable_entity
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name)
  end

  def set_member
    @member = Member.find_by(id: params[:id])
    return if @member

    render json: { error: "Member not found." },
           status: :not_found
  end

  def check_access(member)
    if member && (member.user_id != current_user.id)
      render json: { message: "The current user is not authorized to access this member." }, status: :unauthorized
      return false
    end
    member.present?
  end
end
