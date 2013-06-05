p = Axlsx::Package.new
wb = p.workbook

wb.styles do |style|
  wb.add_worksheet(name: @topic.title) do |sheet|
    cell_rotated_text_style = wb.styles.add_style(:alignment => {:textRotation => 60})
    sheet.add_row([@topic.title], :style => [cell_rotated_text_style])

    @topic.replies.each do |reply|
      sheet.add_row [ ActionController::Base.helpers.strip_tags(reply.content), reply.created_at, reply.created_by.name]
    end

    sheet.sheet_view.pane do |pane|
      pane.top_left_cell = 'B2'
      pane.state = :frozen_split
      pane.y_split = 1
      pane.active_pane = :bottom_right
    end
  end
end

p.to_stream