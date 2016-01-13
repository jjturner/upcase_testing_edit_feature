class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_attributes)
    if @person.save
      redirect_to @person, notice: "Person created."
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to @person, notice: "Person updated."
    else
      render :edit
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  private

  def person_attributes
    params.require(:person).permit(:first_name)
  end

  private
    def person_params
      params.require(:person).permit(:first_name)
    end
end
