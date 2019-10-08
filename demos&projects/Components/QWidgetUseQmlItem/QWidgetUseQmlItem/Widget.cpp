#include "Widget.h"
#include <QQuickWidget>
#include <QQuickItem>
#include <QDebug>

Widget::Widget(QWidget *parent)
    : QWidget(parent)
{
    ui.setupUi(this);

    QQuickWidget *okButton = new QQuickWidget(this);
    okButton->setResizeMode(QQuickWidget::SizeRootObjectToView);
    okButton->setSource(QUrl("qrc:/Widget/qml/OkButton.qml"));
    okButton->resize(150, 32);
    okButton->move(width() / 2 - okButton->width(), height() * 3 / 4);
    okButton->show();


    QQuickWidget *cancelButton = new QQuickWidget(this);
    cancelButton->setResizeMode(QQuickWidget::SizeRootObjectToView);
    cancelButton->setSource(QUrl("qrc:/Widget/qml/CancelButton.qml"));
    cancelButton->resize(150, 32);
    cancelButton->move(okButton->pos().x() + cancelButton->width() + 10, okButton->pos().y());
    cancelButton->show();


    QQuickWidget *titleEditControl = new QQuickWidget(this);
    titleEditControl->setResizeMode(QQuickWidget::SizeRootObjectToView);
    titleEditControl->setSource(QUrl("qrc:/Widget/qml/TitleChangedEdit.qml"));
    titleEditControl->resize(310, 32);
    titleEditControl->move(okButton->pos().x(), okButton->pos().y() + 50);
    titleEditControl->show();

    // connectons
    // ok按钮事件
    connect(okButton->rootObject(), SIGNAL(clicked()), this, SLOT(onOKButtonClicked()));
    // cancel按钮事件
    connect(cancelButton->rootObject(), SIGNAL(clicked()), this, SLOT(onCancelButtonClicked()));
    // titlechanged
    connect(titleEditControl->rootObject(), SIGNAL(titleChanged(QString)), this, SLOT(onTitleChanged(const QString&)));

}

void Widget::onOKButtonClicked()
{
    setWindowTitle(windowTitle().append(" ok clicked"));
}

void Widget::onCancelButtonClicked()
{
    setWindowTitle(windowTitle().append(" cancel clicked"));
}

void Widget::onTitleChanged(const QString& title)
{
    setWindowTitle(title);
}
