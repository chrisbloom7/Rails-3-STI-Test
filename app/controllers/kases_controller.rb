class KasesController < ApplicationController
  # GET /kases
  # GET /kases.xml
  def index
    @kases = Kase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kases }
    end
  end

  # GET /kases/1
  # GET /kases/1.xml
  def show
    @kase = Kase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kase }
    end
  end

  # GET /kases/new
  # GET /kases/new.xml
  def new
    setup_sti_model

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kase }
    end
  end

  # GET /kases/1/edit
  def edit
    @kase = Kase.find(params[:id])
  end

  # POST /kases
  # POST /kases.xml
  def create
    setup_sti_model

    respond_to do |format|
      if @kase.save
        format.html { redirect_to(@kase, :notice => 'Kase was successfully created.') }
        format.xml  { render :xml => @kase, :status => :created, :location => @kase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kases/1
  # PUT /kases/1.xml
  def update
    @kase = Kase.find(params[:id])

    respond_to do |format|
      if @kase.update_attributes(params[:kase])
        format.html { redirect_to(@kase, :notice => 'Kase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kases/1
  # DELETE /kases/1.xml
  def destroy
    @kase = Kase.find(params[:id])
    @kase.destroy

    respond_to do |format|
      format.html { redirect_to(kases_url) }
      format.xml  { head :ok }
    end
  end
  
private
  
  def setup_sti_model
    # Attempt to instantiate the correct Kase subclass based on the type 
    # parameter sent from forms and querystrings
    # logger.debug "Attempting to detect implied Kase subclass"
    if params[:kase].present? and params[:kase][:type].present?
      # Type param found, let's see if it's a valid subclass
      type = params[:kase].delete(:type)
      # logger.debug "Type param '#{type}' found. Looking for match in list of Kase.descendants:"
      begin
        # logger.debug "Attempting to constantize '#{type}' to a model class"
        model = type.constantize
        # logger.debug "Attempting to instantiate '#{type}' model class"
        @kase = model.new(params[:kase])
        # logger.debug @kase.inspect
      rescue => e
        # Type param found, but an error prevented us from creating the 
        # object. Fall through to create a generic Kase object
        # logger.debug "Type param '#{type}' found, but an error prevented us from creating the object: #{e}"
      else
        # No errors encountered, return having instantiated the proper 
        # subclass
        # logger.debug "No errors encountered, returning"
        return
      end
    else
      # No type param was found, fall through to create a generic Kase object
      # logger.debug "Type param not found"
    end
    # If all else fails just instantiate a generic Kase object
    # logger.debug "Could not instantiate a subclass. Creating generic Kase object instead"
    @kase = Kase.new(params[:kase])
    # logger.debug @kase.inspect
  end
end
