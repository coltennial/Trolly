class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  
  def index
    @lists = List.all_lists(current_user.id)
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def edit
  end

  def create
    List.create_list(list_params)
    redirect_to board_lists_path
  end

  def update
    List.update_list(@list.id, list_params)
  end

  def destroy
    List.delete_list(@list.id)
    redirect_to board_lists_path
  end

  private 

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_list 
      @list = List.single_list(params[:id])
    end 

    def list_params 
      params.require(:list).permit(:name, :boards_attributes => [:name])
    end
end
