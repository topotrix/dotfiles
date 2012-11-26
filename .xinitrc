eval `dbus-launch --sh-syntax --exit-with-session`

export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xrdb ~/.Xresources &
xscreensaver &
fcitx&
sh ~/.fehbg &

exec awesome
