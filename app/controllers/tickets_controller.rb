class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      File.open('tickets.csv', 'a') do |file|
        file.puts @ticket.to_csv
      end
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :email, :subject, :content)
  end
end
