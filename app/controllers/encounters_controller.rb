require 'lots/urlparser'
class EncountersController < ApplicationController
  # GET /encounters
  # GET /encounters.json
  def index
    @encounters = Encounter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @encounters }
    end
  end

  # GET /encounters/1
  # GET /encounters/1.json
  def show
    @encounter = Encounter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @encounter }
    end
  end

  # GET /encounters/new
  # GET /encounters/new.json
  def new
    @encounter = Encounter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @encounter }
    end
  end

  # GET /encounters/1/edit
  def edit
    @encounter = Encounter.find(params[:id])
  end

  # POST /encounters
  # POST /encounters.json
  include Lots
  def create
    @encounter = Encounter.new(params[:encounter])
    parser = Urlparser.new(params[:encounter][:url])
    @encounter.raid = parser.raid
    raid_time_left = params[:encounter][:started_at].split(":")
    raid_time_left_minutes = raid_time_left[0].to_i * 60 + raid_time_left[1].to_i
    raid_time_left_total = Time.now - (@encounter.raid.time.hours - raid_time_left_minutes.minutes)

    @encounter.started_at = raid_time_left_total
    respond_to do |format|
      if @encounter.save
        format.html { redirect_to @encounter, notice: 'Encounter was successfully created.' }
        format.json { render json: @encounter, status: :created, location: @encounter }
      else
        format.html { render action: "new" }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /encounters/1
  # PUT /encounters/1.json
  def update
    @encounter = Encounter.find(params[:id])

    respond_to do |format|
      if @encounter.update_attributes(params[:encounter])
        format.html { redirect_to @encounter, notice: 'Encounter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encounters/1
  # DELETE /encounters/1.json
  def destroy
    @encounter = Encounter.find(params[:id])
    @encounter.destroy

    respond_to do |format|
      format.html { redirect_to encounters_url }
      format.json { head :no_content }
    end
  end
end
