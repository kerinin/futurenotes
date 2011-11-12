class NotesController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:index, :show]
  
  # GET /notes
  # GET /notes.json
  def index
    # @notes = Note.all  Cancan

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    #@note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    #@note = Note.new
    @tags = current_user.tags
    
    unless current_user.nil? || current_user.notes.empty?
      @note.tags = current_user.notes.last_created_first.first.tags
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @note }
    end
  end

  # GET /notes/1/edit
  def edit
    #@note = Note.find(params[:id])
    @tags = current_user.tags
  end

  # POST /notes
  # POST /notes.json
  def create
    #@note = Note.new(params[:note])
    @note.user ||= current_user
    @tags = current_user.tags
    
    unless params[:new_tag].nil?
      # check for comma-delimited tag names
      tag_names = params[:new_tag].split(',')
      tag_names.each do |tag_name|
        #use existing tag if available
        tag = Tag.find_or_create_by_name( tag_name.strip )
        @note.tags << tag
      end
    end

    respond_to do |format|
      if @note.save
        format.html { redirect_to user_path(current_user), :notice => 'Note was successfully created.' }
        format.json { render :json => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.json { render :json => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    #@note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to user_path(current_user), :notice => 'Note was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    #@note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), :notice => 'Note was deleted.' }
      format.json { head :ok }
    end
  end
end
