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
BZh91AY&SY<�#� :_��P���_�p?��� ���@ @ P��7�AC�$�<�O)�=OS��OQ� =   z��a4�ѣ�b4�ɉ��4�d�JhJ0J~�yC�4z�#!�i����ѡ�M �EF�hF�  4     (BS�L��T�M2`��h�=5M��h��mJP�U������g���1�[.�]5^�)�` � 
���2�S�	�7O���x���7���J@�*V� ���'d�܈""��������Y{h�Tfϓ(�v�=�ӣ;>�5\��`�,��uZ]���!.A�+h<�p_&���-p�"�)l�X�r�ٹ�'LH^'�q�_k��m C��H�!�����K�q��]�21݂3~?AED�����u\>W�ZUd�(��y^��5�?N�N_��J2m3az��XD���\��9y�lm�X�!�&�ɉ��]QX*��L�3(Btғ5��Y�]�9(�� �e��35@C`-	� ���e��F�!��'��Nn;�x;Y�@�v�f��qD^�f�=�����`�m��I���5����U�Y��-�e��2��
�z)��D�KԷ5�Im��$��4���ê���#��,5.�ȹ�d	呸���д���K�ZLډBZb��t���ܮÓ��񲦅�FC�&�-��6��z3�o�4H�m]b�+�wݬ! U !�Tv\��I�ӑ��f:�b�jBÀa"��x4L�EILX2�b�+CKc0��<��â���H��@�hX��}�U��ICx��/�2%��[�i�KՔ��wh@�L�'6I�r�}J�ʱb
�E["7�$!#"p��񌫮��뺩J9ji),���ȭ�'&)BR4�~�z̠�ap����� ��p�� $>��rE8P�<�#�