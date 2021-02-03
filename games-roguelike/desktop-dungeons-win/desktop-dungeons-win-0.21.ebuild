EAPI=7

inherit desktop

DESCRIPTION="Desktop Dungeons is a roguelike which plays fast -- each round is typically under 10 minutes.Â  It features an extensive unlock system for additional replay value."

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
S="${WORKDIR}"
SRC_URI="http://www.qcfdesign.com/Files/DesktopDungeons/DesktopDungeons_v021.exe -> DD.zip"
DEPEND="app-emulation/wine-prefix"
RESTRICT="mirror"

src_unpack() {
	unpack DD.zip
}

src_install() {
	insinto "/opt/Wine/drive_c/Program Files (x86)"
	doins boss_find.wav
        doins boss_kill.wav
        doins -r chardata
        doins DD.dat
        doins death.wav
        doins DesktopDungeons.exe
        doins dungeon_enter.wav
        doins fight.wav
        doins general.wav
        doins netread.dll
        doins readme.txt
        doins spell.wav
        doins startup.wav
        doins -r tilesets

	exeinto /opt/bin
	newexe "${FILESDIR}"/desktop-dungeons-win.sh desktop-dungeons-win

	domenu "${FILESDIR}/desktop-dungeons-win.desktop"
	doicon "${FILESDIR}/desktop-dungeons-win.png"
}
