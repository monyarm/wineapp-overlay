EAPI=7


DESCRIPTION="Global Wine Prefix"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
S="${WORKDIR}"
FEATURES='-sandbox -usersandbox'
SANDBOX_WRITE="/dev/input:/dev/bus:/dev/null"
DEPEND="virtual/wine"
pkg_setup() {
	enewgroup wine
	enewuser wine -1 -1  /dev/null wine
}
src_compile() {
	mkdir "${S}/_temp"
	chown portage:portage "${S}/_temp"
	WINEPREFIX="${S}/_temp/Wine" wineboot --init > /dev/null 2>&1
}
src_install() {
	insinto /opt
	doins  -r "_temp/Wine"
	fowners wine:wine /opt/Wine
	fperms 775 /opt/Wine
}
