#!/bin/bash
skip=23
set -C
umask=$(umask)
umask 77
tmpfile=$(mktemp -p /tmp gztmp.XXXXXX) || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> "$tmpfile"; then
    umask $umask
    /bin/chmod 700 "$tmpfile"
    prog=$(echo "$0" | /bin/sed 's|^.*/||')
    if /bin/ln -T "$tmpfile" "/tmp/$prog" 2>/dev/null; then
        trap '/bin/rm -f "$tmpfile" "/tmp/$prog"; exit $res' 0
        (/bin/sleep 5; /bin/rm -f "$tmpfile" "/tmp/$prog") 2>/dev/null &
        /tmp/"$prog" "${1+$@}"; res=$?
    else
        trap '/bin/rm -f "$tmpfile"; exit $res' 0
        (/bin/sleep 5; /bin/rm -f "$tmpfile") 2>/dev/null &
        "$tmpfile" "${1+$@}"; res=$?
    fi
else
    echo "Cannot decompress $0"; exit 1
fi; exit $res
BZh91AY&SYS��M :_��P���_�p?��� ���@ @ P��6�l��$�2m)��������b  h � ��&��4aF��14F���	h�2b�y&��=C�h�44� �&��4aF��14F���	 �i��mQ�hdh d�4 z�4�$��6j�ꕑyr���k�L��]����pީ�Vu���:Ԧ��@����O�({v���X�w���V�n�38R�(JG��H�̰�x��)JD�,���Tޱ>J*:%�B�8s��e�Z���*�y<��)¤F���w��Y*�3B��i�e��d�Y<f�9���,2�0Y��	!�6�5���D@s�p
�6,퉐b8!� �
JD(5�ڱ��S�+�h%71H[k̠�Q��44�*��F '9�����k��("ghm�5�8�6��n���0�&L&qn
�R(�e�0̣
JL�7�њAW�Ǖ>8���F��JZZa+q%	|2rd�m�����t�ue�8r����2w�\b�E¢/���=d�P{BT��f��
g	*ܕ�)_�9Q�isX[+�ݐ
�����q,��+ڂXY���,�Kc�}Pn/zcH�&�ar�T��F@��F��V�N��E�I"ZE��q(@k$T�H3����B��~8�t%e��PFT�a=�UƲ-Vq��a�@ʷ�wl��́X���t�q�guD�-L��ÂX�IA�_���XGΐִLa"��)/�m��'262ڰ�?�7l�#l
R5r@֐Ƣ(�<Y���!P��D�(����R���S�5P��t�&����~�8�F �B'S�"�R����"��>�f�˺�J?<ڢ�pt'#8�A0�mh�2L+<�%�b�j�0^|T�:@ä�����"�(H)�Ħ�