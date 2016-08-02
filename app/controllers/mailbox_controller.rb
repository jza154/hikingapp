class MailboxController < ApplicationController
  before_action :authenticate_user!
  
  def inbox
    @inbox = mailbox.inbox.paginate(:page => params[:page], per_page: 10)
    @active = :inbox
  end

  def sentbox
    @sentbox = mailbox.sentbox.paginate(:page => params[:page], per_page: 10)
    @active = :sentbox
  end

  def trash
    @trash = mailbox.trash.paginate(:page => params[:page], per_page: 10)
    @active = :trash
  end
end