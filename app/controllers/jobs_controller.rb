class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]
  before_action :set_company, only: [:new, :create, :edit]

  def index
    @jobs = sort_jobs
  end

  def new
    @job = Job.new
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit

  end

  def update
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end
  end

  def destroy
    company = @job.company
    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted"
    redirect_to company_jobs_path(@job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def sort_jobs
    if params[:sort] == "location"
      jobs = Job.order(:city)
    elsif params[:sort] == "interest"
      jobs = Job.order(level_of_interest: :desc)
    elsif params[:location]
      jobs = Job.where(city: params[:location])
    else
      jobs = Job.all
    end
    jobs
  end

end
