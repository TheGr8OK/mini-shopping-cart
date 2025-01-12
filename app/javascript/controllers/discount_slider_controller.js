import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["slider", "discount", "total"];

  connect() {
    this.subtotal = parseFloat(this.totalTarget.innerText);
    if (localStorage.getItem("discount")) {
      this.sliderTarget.value = localStorage.getItem("discount");
    }
    this.updateValue();
    this.sliderTarget.addEventListener("input", this.updateValue.bind(this));
  }

  updateValue() {
    this.discountTarget.innerText = this.sliderTarget.value;
    localStorage.setItem("discount", this.sliderTarget.value);
    this.fillSliderColor();
    this.calculateTotal();
  }

  fillSliderColor() {
    const slider = this.sliderTarget;
    const percentage = (slider.value / slider.max) * 100;
    const color = `linear-gradient(to right, #16A34A ${percentage}%, #E5E7EB ${percentage}%)`;
    slider.style.background = color;
  }

  calculateTotal() {
    const discount = parseFloat(this.discountTarget.innerText);
    const totalAfterDiscount = this.subtotal - discount;
    this.totalTarget.innerText = totalAfterDiscount.toFixed(2);
  }
}
