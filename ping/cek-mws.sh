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
BZh91AY&SYF �  ;���P^���_�p?��� ���@ @ P�OD�Q�BIS��zjz����z��  Ѓ@2da�a4�h2hɐ�	��F!��G��4hCC�hh�i�L�2da�a4�h2hɐ�	&���M2e����i�4 h�@�@4����r�rc�l�I�wӠ����1�`�]躪�UJ�c A 
�"�e�������S|�#/9gZ�3D)�(���2�S�o��I��fq/�v ����UU�,�9Z�����Fe��`�Y���iR`��7�C־�R�N��HZ!��E��r�e8x;Lcc��9�7B�&���m�i&����z!S���Z��źؙ/�A��!@���ڃkoK��&���g^u �h��d��OQY����dhm3p�ie)"fhm���(q�6��n��C�L)	�	��ZH���Y�fRI�'m}�RC~Vx⇻)Xf�(E�y!-]��/�N,�m���Z�6��N^WsB�u3i��2|��wTE�T��J��J�U�ƶl�T<D��j���hq�5��tX�-�ߐ����b"b��Z��XY�iJ$�p1�b�T��1�on0ȶV��F@��N�Q+�Uʮ{RH��c-�J�@��o�18T��x�1�T3š	��E�Z-�W�]"�λ��}\��(� 逆A���˩r��Bi����:�;���}+ ߽���*J�U�Fg��f6�_^;��N*�7��#�� Y/!r��Ja�
VY��?�$ �v��4�����d��-2L
�1��U!S06D7lR���a��1�j���l���Ja�'�͂(jQ#DZ��|��3�1�L,\]�Uxx�\b�"�a�$t�)�/���)�0� 