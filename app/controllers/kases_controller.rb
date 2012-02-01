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
    # This lets us set the "type" attribute from forms and querystrings
    model = nil
    if !params[:kase].blank? and !params[:kase][:type].blank?
      model = params[:kase].delete(:type).constantize.to_s
    end
    @kase = Kase.new(params[:kase])
    @kase.type = model
  end
end
