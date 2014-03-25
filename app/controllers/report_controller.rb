class ReportController < ApplicationController
  def mrs_export
  end

  def mrs_export_extract
    start_date = Date.new(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    end_date = Date.new(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)

    @content = MrsExportReport.new(start_date: start_date, end_date: end_date).to_text

    send_data @content,:type => 'text',:disposition => "attachment; filename=mrs_export_#{start_date.strftime('%Y%m%d')}_a_#{end_date.strftime('%Y%m%d')}.txt"
  end
end
