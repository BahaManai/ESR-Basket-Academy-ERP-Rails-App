import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.confirmMessage = this.element.dataset.confirmMessage;

    if (!this.hasClickListener) {
      this.element.addEventListener('click', this.confirm.bind(this));
      this.hasClickListener = true;
    }
  }

  confirm(event) {
    if (!confirm(this.confirmMessage)) {
      event.preventDefault();
    }
  }
}
