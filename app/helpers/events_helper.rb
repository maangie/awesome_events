module EventsHelper
  def datetime_select_now(f, column)
    now = Time.zone.now

    f.datetime_select column,
                      start_year: now.year, end_year: now.year + 1
  end

  def submit_tag_with_label(f, default_label, wait_label)
    f.submit default_label,
             class: 'btn btn-default', data: { disable_with: wait_label }
  end

  def button_tag_with_label(f, default_label, wait_label, css_class)
    f.button default_label, class: css_class, data: { disable_with: wait_label}
  end

  def link_to_edit_event(event)
    link_to 'イベントを編集する', edit_event_path(@event),
            class: 'btn btn-info btn-lg btn-block'
  end

  def link_to_delete_event(event)
    link_to 'イベントを削除する', event_path(@event),
            class: 'btn btn-danger btn-lg btn-block',
            method: :delete, data: { confirm: '本当に削除しますか？' }
  end

  NEW_EVENT_TICKET_LABEL = '参加する'
  NEW_EVENT_TICKET_CSS_CLASS = 'btn btn-primary btn-lg btn-block'

  def button_tag_for_new_event_ticket(target)
    button_tag NEW_EVENT_TICKET_LABEL, class: NEW_EVENT_TICKET_CSS_CLASS,
               data: {toggle: 'modal', target: target}
  end

  def link_to_new_event_ticket
    link_to NEW_EVENT_TICKET_LABEL, new_event_ticket_path(@event),
            class: NEW_EVENT_TICKET_CSS_CLASS
  end

  def modal_tag(id, labelledby, &block)
    content_tag :div, class: 'modal fade', id: id, tabindex: -1, role: 'dialog',
                'aria-labelledby': labelledby, 'area-hidden': true, &block
  end

  def close_button_tag
    button_tag '&times;'.html_safe, type: 'button', class: 'close',
               data: { dismiss: 'modal' }, 'area-hidden': true
  end

  def build_ticket_form_for(event, &block)
    form_for event.tickets.build, url: event_tickets_path(event), remote: true,
             &block
  end
end
