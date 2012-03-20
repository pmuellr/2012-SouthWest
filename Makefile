# Makefile

.PHONY: build vendor icons

JQUERY   = 1.0.1
GLYPHISH = ~/Projects/GlyphishPro

#-------------------------------------------------------------------------------
build:
	@echo TBD

#-------------------------------------------------------------------------------
vendor: vendor-init vendor-jquery vendor-glyphish
	@rm -rf tmp

#-------------------------------------------------------------------------------
vendor-init:
	@rm -rf vendor
	@mkdir  vendor

	@rm -rf tmp
	@mkdir  tmp

#-------------------------------------------------------------------------------
vendor-jquery:
	@echo downloading jquery mobile

	@rm -rf tmp
	@mkdir  tmp

	@mkdir vendor/jquery-mobile
	@mkdir vendor/jquery-mobile/images

#	@curl --progress-bar -o tmp/jquery-mobile.zip http://code.jquery.com/mobile/$(JQUERY)/jquery.mobile-$(JQUERY).zip
	@curl -s -o tmp/jquery-mobile.zip http://code.jquery.com/mobile/$(JQUERY)/jquery.mobile-$(JQUERY).zip
	@unzip -qq tmp/jquery-mobile.zip -d tmp

	@mv tmp/jquery.mobile-$(JQUERY) tmp/jquery-mobile
	@mv tmp/jquery-mobile/images/* vendor/jquery-mobile/images
	@mv tmp/jquery-mobile/*.min.css vendor/jquery-mobile
	@mv tmp/jquery-mobile/*.min.js  vendor/jquery-mobile

#-------------------------------------------------------------------------------
CopyIconG1x = cp $(GLYPHISH)/$(1)/$(1)-gray/$(2).png     vendor/glyphish/g/$(1)/$(2)-1x.png
CopyIconG2x = cp $(GLYPHISH)/$(1)/$(1)-gray/$(2)@2x.png  vendor/glyphish/g/$(1)/$(2)-2x.png
CopyIconW1x = cp $(GLYPHISH)/$(1)/$(1)-white/$(2).png    vendor/glyphish/w/$(1)/$(2)-1x.png
CopyIconW2x = cp $(GLYPHISH)/$(1)/$(1)-white/$(2)@2x.png vendor/glyphish/w/$(1)/$(2)-2x.png

CopyIcons = $(call CopyIconG1x,$1,$2); $(call CopyIconG2x,$1,$2); $(call CopyIconW1x,$1,$2); $(call CopyIconW2x,$1,$2); 

#-------------------------------------------------------------------------------
vendor-glyphish:
	@echo copying glyphish icons

	@mkdir vendor/glyphish
	@mkdir vendor/glyphish/g
	@mkdir vendor/glyphish/w
	@mkdir vendor/glyphish/g/icons
	@mkdir vendor/glyphish/g/mini
	@mkdir vendor/glyphish/g/xtras
	@mkdir vendor/glyphish/w/icons
	@mkdir vendor/glyphish/w/mini
	@mkdir vendor/glyphish/w/xtras

	@$(call CopyIcons,icons,25-weather)
	@$(call CopyIcons,xtras,36-circle-west)
