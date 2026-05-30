#!/bin/bash

# Función para actualizar tabs en un archivo
update_file() {
  local file="$1"
  local tab_name="$2"
  
  # Reemplazar sección de tabs
  sed -i 's/<!-- TABS -->.*<!-- TABS -->/<!-- TABS -->\n<div class="tabs-container">\n  <button class="tab" onclick="navigateToTab(..\/tab_production\/productions.html)">Productions<\/button>\n  <button class="tab" onclick="navigateToTab(..\/tab_product\/products.html)">Products<\/button>\n  <button class="tab" onclick="navigateToTab(..\/tab_rides_exp\/rides_experiences.html)">Rides \& Exp.<\/button>\n  <button class="tab" onclick="navigateToTab(..\/tab_product_categories\/product_categories.html)">Products Categories<\/button>\n  <button class="tab" onclick="navigateToTab(..\/tab_gateway\/gateways.html)">Gateway<\/button>\n  <button class="tab" onclick="navigateToTab(..\/tab_devices\/devices.html)">Devices<\/button>\n  <button class="tab" onclick="navigateToTab(..\/tab_device_locations\/device_locations.html)">Device by Locations<\/button>\n  <button class="tab" onclick="navigateToTab(..\/tab_integrations\/integrations.html)">Integrations<\/button>\n<\/div>/g' "$file"
}

# Actualizar products.html
sed -i '/<button class="tab"/,/<\/div>/c\
  <button class="tab" onclick="navigateToTab('"'"'../tab_production/productions.html'"'"')">Productions<\/button>\
  <button class="tab active" onclick="navigateToTab('"'"'../tab_product/products.html'"'"')">Products<\/button>\
  <button class="tab" onclick="navigateToTab('"'"'../tab_rides_exp/rides_experiences.html'"'"')">Rides & Exp.<\/button>\
  <button class="tab" onclick="navigateToTab('"'"'../tab_product_categories/product_categories.html'"'"')">Products Categories<\/button>\
  <button class="tab" onclick="navigateToTab('"'"'../tab_gateway/gateways.html'"'"')">Gateway<\/button>\
  <button class="tab" onclick="navigateToTab('"'"'../tab_devices/devices.html'"'"')">Devices<\/button>\
  <button class="tab" onclick="navigateToTab('"'"'../tab_device_locations/device_locations.html'"'"')">Device by Locations<\/button>\
  <button class="tab" onclick="navigateToTab('"'"'../tab_integrations/integrations.html'"'"')">Integrations<\/button>\
<\/div>' tab_product/products.html

echo "✅ Tabs actualizados en products.html"
