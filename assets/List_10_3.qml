import bb.cascades 1.3

NavigationPane {
    id: navigationPane
    
    Page {
        id: rootPage
        property int toggle: -1
        onToggleChanged: {
            if(toggle == 1){
                titleBar.title = "ON"
            } else {
                titleBar.title = "OFF"
            }
        }
        
        titleBar: TitleBar {
            id: titleBar
            title: qsTr("short cuts 10.3 - S toggles Title")
            scrollBehavior: TitleBarScrollBehavior.Sticky
        }
        
        attachedObjects: [
            ComponentDefinition {
                id: shortcutSearchComponent
                SystemShortcut {
                    type: SystemShortcuts.Search
                    onTriggered: {
                        if(rootPage.toggle < 1){
                            rootPage.toggle = 1
                        } else {
                            rootPage.toggle = 0
                        }
                    }
                }
            }
        ]
        
        actionBarVisibility: ChromeVisibility.Compact
        
        Container {
            id: outerContainer
            layout: DockLayout {
            }
            
            ListView {
                id: listView
                topPadding: ui.du(4.0)
                scrollRole: ScrollRole.Main
                focusPolicy: FocusPolicy.KeyAndTouch
                
                dataModel: GroupDataModel {
                    id: dataModel
                    grouping: ItemGrouping.ByFirstChar
                    sortingKeys: ["name"]
                }
                
                listItemComponents: [
                    ListItemComponent {
                        type: "header"
                        Container {
                            id: headerRoot
                            leftPadding: ui.du(4.0)
                            topPadding: ui.du(2.0)
                            bottomPadding: ui.du(2.0)
                            Label {
                                text: ListItemData
                                textStyle.base: SystemDefaults.TextStyles.BigText
                            }
                        }
                    },
                    ListItemComponent {
                        type: "item"
                        Container {
                            id: itemRoot
                            leftPadding: ui.du(6.0)
                            Label {
                                text: ListItemData.name
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                            }
                        }
                    }
                ]
                
                onTriggered: {
                    //
                }
                
                
            } // listView
            
        } // outerContainer
        
        
        
        onCreationCompleted: {
            dataModel.insert({"name":"alpha"})
            dataModel.insert({"name":"centaury"})
            dataModel.insert({"name":"beta"})
            dataModel.insert({"name":"blue"})
            dataModel.insert({"name":"BlackBerry"})
            dataModel.insert({"name":"ekke"})
            dataModel.insert({"name":"ekkes-corner"})
            dataModel.insert({"name":"test"})
            dataModel.insert({"name":"zzz"})
            //
            // curious: in a more complex app shortcuts at Classic only working on ListView and for Passport on Page
            // in this sample app shortcuts for Classic are working on both, Passport only on Page
            if (app.isPassport()){
                console.debug("shortcuts at Page")
                rootPage.shortcuts = [shortcutSearchComponent.createObject()]
            } else {
                console.debug("shortcuts at ListView")
                listView.shortcuts = [shortcutSearchComponent.createObject()]
            }
        }
        
    } // rootPage
    
    
} // navigationPane
