class ChildrenController < ApplicationController
  # GET /children
  # GET /children.xml
  def index
    @children = Child.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @children }
    end
  end

  # GET /children/1
  # GET /children/1.xml
  def show
    @child = Child.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @child }
    end
  end

  # GET /children/new
  # GET /children/new.xml
  def new
    @child = Child.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @child }
    end
  end

  # GET /children/1/edit
  def edit
    @child = Child.find(params[:id])
  end

  # POST /children
  # POST /children.xml
  def create
    @child = Child.new(params[:child])

    respond_to do |format|
      if @child.save
        format.html { redirect_to(@child, :notice => 'Child was successfully created.') }
        format.xml  { render :xml => @child, :status => :created, :location => @child }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /children/1
  # PUT /children/1.xml
  def update
    @child = Child.find(params[:id])

    respond_to do |format|
      if @child.update_attributes(params[:child])
        format.html { redirect_to(@child, :notice => 'Child was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.xml
  def destroy
    @child = Child.find(params[:id])
    @child.destroy

    respond_to do |format|
      format.html { redirect_to(children_url) }
      format.xml  { head :ok }
    end
  end
end
