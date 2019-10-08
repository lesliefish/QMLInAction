#pragma once

#include <QtWidgets/QWidget>
#include "ui_Widget.h"

class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = Q_NULLPTR);

private slots:

void onOKButtonClicked();
void onCancelButtonClicked();
void onTitleChanged(const QString& title);

private:
    Ui::WidgetClass ui;
};
