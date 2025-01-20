import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.confirmMessage = this.element.dataset.confirmMessage;
    console.log("Confirm Message:", this.confirmMessage);
    this.element.addEventListener('click', this.confirm.bind(this))
  }

  confirm(event) {
    if (!confirm(this.confirmMessage)) {
      event.preventDefault()
    }
  }
}
