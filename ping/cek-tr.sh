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
BZh91AY&SYv�#� ���\T@ ���������PٶQ��i�mQݕ�	�Sjz	�j`�i�� �4I!�#E)�d�H�=C4�Ɛ	M	6�F��z��4h4h� 4�dd�&�d4d2d  �24!�$�IOS�=��ɩ�OBe h�   �h�����s(�F�N�G])E��J%����Kj���A	Ȫ��J��S~	���2��)�@��;:]+$#�EB���������g!Rb>�A`Ӈs�R���m�
*�!t��/�2f�/���ka*98�W-j�ZD�$�{+�1��h�D͂���Tgv{&]��;�����$L�r���^i�
�u)]/���Yb��ǫ�w��B.��ch�a���(�x��y�LΧQ�_f���]{��I1n�fʦ�mv�VUBi��TDC��-�I��Ej�8E�rtm1]7_���n��h)���u$�f� e 0����Vɫt��4i�6[���э��Z2v��`_БHg-E��ӸZZ�< �wS��m�M�%�SN��ZU��j��Lc$����[�M`쒨,81rY��>0��Zi�7݀�>�����9s������n"���1�h�x�ŭ%��(~�����@������-��0	��Ɉd�Jh�c�fbM��8�6�ǧ�05�Epӄի���QqI�0�dټ���#��S6�g�Nȅm]`q���ʶ�W�H���
�ZB���myf�oR.�TN��3(��-?�¢�:�f)[����do+�/����[-t*T�#RJ����ҩ)bL+AϽG+"0�5u�u	�겤�E�q�+�Ȍ �x`��ʂ�����}���/g�kl�0��В���A(�5����K�j��|V� Ok<O�Eb�]�V���5������r��L��h�Kq�
���qnY��O)\	��Hj�|N�5UL,���ta:"�;�uA;��#+��B�NT�6;`�/l�钜�հaZ� b&F$�F�S׉�\v��A'X!"��M���;ܜH�<<J�Pt̘�/P?pH<��6�Q����Xp^��),��+ˁ2�G���紅��G01:��R2��L��>iT4�D�R�����0jǔQ]�Qt����@�q�����tSMx�VP�Ɋ��ƠT��,z�n��L��	�� T���u�L���m�u���q�s��ܑN$��� 