import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['org_choice_button', 'org_dropdown_list']

  connect() {
    $('#org_dropdown_list').hide()
    $('#org_choice_button').click(function () {
      $('#org_dropdown_list').slideToggle()
    })
  }
}
