class RaidsController < ApplicationController
  # GET /raids
  # GET /raids.json
  def index
    @raids = Raid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raids }
    end
  end

  # GET /raids/1
  # GET /raids/1.json
  def show
    @raid = Raid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raid }
    end
  end

  # GET /raids/new
  # GET /raids/new.json
  def new
    @raid = Raid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raid }
    end
  end

  # GET /raids/1/edit
  def edit
    @raid = Raid.find(params[:id])
  end

  # POST /raids
  # POST /raids.json
  def create
    @raid = Raid.new(params[:raid])

    respond_to do |format|
      if @raid.save
        format.html { redirect_to @raid, notice: 'Raid was successfully created.' }
        format.json { render json: @raid, status: :created, location: @raid }
      else
        format.html { render action: "new" }
        format.json { render json: @raid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /raids/1
  # PUT /raids/1.json
  def update
    @raid = Raid.find(params[:id])

    respond_to do |format|
      if @raid.update_attributes(params[:raid])
        format.html { redirect_to @raid, notice: 'Raid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raids/1
  # DELETE /raids/1.json
  def destroy
    @raid = Raid.find(params[:id])
    @raid.destroy

    respond_to do |format|
      format.html { redirect_to raids_url }
      format.json { head :no_content }
    end
  end
end
