release:
	@rm -rf releases/
	@mkdir -p releases/amd64
	@mkdir -p releases/i386
	@rsync -avq  --delete --delete-excluded debian/ releases/amd64/ --exclude "/debian/usr/share/ioncube/i386"
	@rsync -avq  --delete --delete-excluded debian/ releases/i386/ --exclude "/debian/usr/share/ioncube/amd64"
	@sed -i releases/amd64/DEBIAN/control -e "s/Architecture:/Architecture: amd64/"
	@sed -i releases/i386/DEBIAN/control -e "s/Architecture:/Architecture: i386/"
	@dpkg-deb -b releases/amd64 releases/tvip-ioncube_amd64.deb
	@dpkg-deb -b releases/i386 releases/tvip-ioncube_i386.deb
	@rm -rf releases/amd64
	@rm -rf releases/i386


