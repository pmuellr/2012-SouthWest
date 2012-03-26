# Makefile

.PHONY: build vendor icons

JQUERY   = 1.7.1
JQUERYM  = 1.0.1
GLYPHISH = ~/Projects/GlyphishPro

#-------------------------------------------------------------------------------
build:
#	@echo updating weather
#	@tools/update-weather.sh

#	@echo building weather json
#	@tools/build-weather-json.js

	@coffee --bare --compile --output scripts scripts-src/main.coffee

	@echo updating manifest
	@tools/update-manifest.sh

#-------------------------------------------------------------------------------
deploy:
	@echo deploying to muellerware.org/travel/2012-SouthWest
	@rsync -av --exclude /weather --exclude /.git --exclude /scripts/weather.js \
	    . muellerware.org:web/public/travel/2012-SouthWest

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

	@curl -s -o tmp/jquery-mobile.zip http://code.jquery.com/mobile/$(JQUERYM)/jquery.mobile-$(JQUERYM).zip
	@unzip -qq tmp/jquery-mobile.zip -d tmp

	@mv tmp/jquery.mobile-$(JQUERYM) tmp/jquery-mobile
	@mv tmp/jquery-mobile/images/*                                  vendor/jquery-mobile/images
	@mv tmp/jquery-mobile/jquery.mobile.structure-$(JQUERYM).min.css vendor/jquery-mobile/jquery.mobile.structure.min.css
	@mv tmp/jquery-mobile/jquery.mobile-$(JQUERYM).min.css           vendor/jquery-mobile/jquery.mobile.min.css
	@mv tmp/jquery-mobile/jquery.mobile-$(JQUERYM).min.js            vendor/jquery-mobile/jquery.mobile.min.js
	
	@curl -s -o vendor/jquery-mobile/jquery.min.js http://code.jquery.com/jquery-$(JQUERY).min.js

#-------------------------------------------------------------------------------
CopyIconG1x = cp $(GLYPHISH)/$(1)/$(1)-gray/$(2).png     vendor/glyphish/g/$(1)/$(2)-1x.png
CopyIconG2x = cp $(GLYPHISH)/$(1)/$(1)-gray/$(2)@2x.png  vendor/glyphish/g/$(1)/$(2)-2x.png
CopyIconW1x = cp $(GLYPHISH)/$(1)/$(1)-white/$(2).png    vendor/glyphish/w/$(1)/$(2)-1x.png
CopyIconW2x = cp $(GLYPHISH)/$(1)/$(1)-white/$(2)@2x.png vendor/glyphish/w/$(1)/$(2)-2x.png

CopyIcons = $(call CopyIconG1x,$1,$2); $(call CopyIconG2x,$1,$2); $(call CopyIconW1x,$1,$2); $(call CopyIconW2x,$1,$2); 

#-------------------------------------------------------------------------------
vendor-glyphish:
	@echo copying glyphish icons

	@rm -rf vendor/glyphish
	
	@mkdir vendor/glyphish
	@mkdir vendor/glyphish/g
	@mkdir vendor/glyphish/w
	@mkdir vendor/glyphish/g/icons
	@mkdir vendor/glyphish/g/mini
	@mkdir vendor/glyphish/g/xtras
	@mkdir vendor/glyphish/w/icons
	@mkdir vendor/glyphish/w/mini
	@mkdir vendor/glyphish/w/xtras

	@$(call CopyIcons,icons,11-clock)
	@$(call CopyIcons,icons,25-weather)
	@$(call CopyIcons,icons,103-map)
	@$(call CopyIcons,icons,40-inbox)
	@$(call CopyIcons,icons,06-magnify)
	@$(call CopyIcons,xtras,04-arrow-northeast)
	@$(call CopyIcons,xtras,36-circle-west)

