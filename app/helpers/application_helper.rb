module ApplicationHelper
  def date_select_now(f, column)
    now = Time.zone.now
    f.date_select(column,
                  start_year: now.year, end_year: now.year + 1, prompt: true)
  end

  def stylesheet_link_tag_with_turbolinks
    stylesheet_link_tag 'application', media: 'all',
                        'data-turbolinks-track' => true
  end

  def collapse_button_tag(target, &block)
    button_tag type: 'button', class: 'navbar-toggle',
               data: { toggle: 'collapse', target: target }, &block
  end

  def url_for_twitter(user)
    "https://twitter.com/#{user.nickname}"
  end
end
