module ApplicationHelper
  def render_permissions(permissions)
    raw permissions.split(',').collect { |permission|
      content_tag :span, t("sys.permissions.#{permission}"), class: 'label label-success'
    }.join('')
  end

end
