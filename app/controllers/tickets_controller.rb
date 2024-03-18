class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def manage
    @tickets = Ticket.all
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to manage_tickets_path, notice: 'Ticket updated successfully'
    else
      render :edit
    end
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save # TODO: Validate only
      @ticket.save_to_csv
      redirect_to tickets_path, notice: 'Ticket created successfully.'
    else
      render :new
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to manage_tickets_path, notice: 'Ticket deleted successfully'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :email, :subject, :content)
  end
end
