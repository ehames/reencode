#!/bin/bash
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Reencode - Edgardo Hames - ehames@gmail.com
#
# This bash script reencodes movies so they can be played on DVD players
# including Philips PD 9016/37 (portable DVR player for cars).
#
# Usage: reencode <input file>
#
# A new avi file is created in "reencode" directory (input file is not modified).


OUTPATH="./reencode"
mkdir -p "${OUTPATH}"

IF="$1"; NOEXT="${IF%.*}"; NOPATH="${NOEXT##*/}"
OF="${OUTPATH}/${NOPATH}-reencode.avi"

echo "input file:  ${IF}"
echo "output file: ${OF}"

ffmpeg  -i "${IF}" \
	-r 25 -s 640x220 -aspect 16:9 -b:v 988k -vcodec libxvid -vtag xvid \
	-acodec libmp3lame -ac 2 -ab 128k \
	-map_metadata -1 \
	"${OF}"

