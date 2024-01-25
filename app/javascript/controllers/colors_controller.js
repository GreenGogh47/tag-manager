import { Controller } from "@hotwired/stimulus"
import "@melloware/coloris/dist/coloris.css";
import Coloris from "@melloware/coloris";

// Connects to data-controller="colors"
export default class extends Controller {
  connect() { 
    Coloris.init();
    Coloris({ el: "#post_font_color" });
  }
}
