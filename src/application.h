#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>
#include <QSystemTrayIcon>
#include <QMenu>
#include <QApplication>
#include <QSettings>
#include <QMultiMap>
#include <QFile>
#include <QTextStream>
#include <QxtGlobalShortcut>

#include "settingsdialog.h"
#include "Station.h"
#include "MyPlayer.h"

class Application : public QObject
{
    Q_OBJECT
public:
    explicit Application(QObject *parent = 0);
    ~Application();    

    QSystemTrayIcon trayItem;
    QMenu trayMenu;
    QMenu *stationsMenu;
    QSettings * settings;
    SettingsDialog settingsDialog;
    MyPlayerView player;
    QStringList trayIconList;
    int trayIconCount, currTrayIcon;      

    qreal volumeLevel;
    // �������� �������� ������� ���� - ��������� � �����
    void createBaseMenu();
    // �������� ������� ������� �� �����
    bool loadSettings();
    // ���������� �������� ��� ���������� ���������
    QAction * appendStation(QString name, QString description, QString url, QString enc);

    void manageSettings();
    void configure();
signals:

public slots:
    // ���������� "�������� �� ����"
    void processMenu(QAction *action);
    void animateIcon(quint64 tick);
    void onPlayerStop();
    void onPlayerPlay();
    void onMetaDataChange(QMultiMap<QString, QString> data);

    void stopPlayer();
    void increaseVolume();
    void decreaseVolume();

private:
    bool eventFilter(QObject *object, QEvent *event);
    QxtGlobalShortcut *globalShortcut;

};

#endif // APPLICATION_H
