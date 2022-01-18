import { Controller } from "stimulus";

export default class extends Controller {
  static targets = 'dates';

  connect() {
    console.log(this.element);
    console.log(this.datesTarget);
  }

  send(event) {
    event.preventDefault();

    console.log('TODO: send request in AJAX');
  }
}
