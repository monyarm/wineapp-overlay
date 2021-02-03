EAPI=7

DESCRIPTION="Global Wine Prefix"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
DEPEND="acct-group/wine"

src_compile() {
	WINEPREFIX="Wine" wineboot --init

}

src_install() {
	insinto /opt
	doins  -r Wine
	fowners wine:wine /opt/Wine
	fperms 775 /opt/Wine
}
