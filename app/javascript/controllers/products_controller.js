import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  reset() {
    localStorage.removeItem("discount");
  }
}
