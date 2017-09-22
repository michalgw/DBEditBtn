unit DBEditBtn;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, GroupedEdit, db, EditBtn, DbCtrls, LCLType, LMessages,
  MaskEdit, Controls, CalcForm, Forms, Graphics;

type
  { TDBEbEdit }

  TDBEbEdit = class(TEbEdit)
  private
    FDataLink: TFieldDataLink;
    FCustomEditMask: Boolean;
    FFocusedDisplay: boolean;
    FKillFocus: Boolean;
    procedure DataChange(Sender: TObject);
    procedure UpdateData(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure CMGetDataLink(var Message: TLMessage); message CM_GETDATALINK;
  protected
    function GetReadOnly: Boolean; override;
    procedure SetReadOnly(Value: Boolean); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure UTF8KeyPress(var UTF8Key: TUTF8Char); override;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function EditCanModify: Boolean; override;
    function GetEditText: string; override;

    procedure Change; override;
    procedure Reset; override;

    procedure WMSetFocus(var Message: TLMSetFocus); message LM_SETFOCUS;
    procedure WMKillFocus(var Message: TLMKillFocus); message LM_KILLFOCUS;
    procedure WndProc(var Message: TLMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(AAction: TBasicAction): Boolean; override;
    function UpdateAction(AAction: TBasicAction): Boolean; override;
    property Field: TField read GetField;
    property CustomEditMask: Boolean read FCustomEditMask write FCustomEditMask default False;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
  end;

  { TCustomDBEditButton }

  TCustomDBEditButton = class(TCustomEditButton)
  private
    function GetCustomEditMask: Boolean;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetEdit: TDBEbEdit;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetCustomEditMask(AValue: Boolean);
    procedure SetDataField(AValue: string);
    procedure SetDataSource(AValue: TDataSource);
    procedure SetReadOnly(AValue: Boolean);
  protected
    function GetFieldDataLink: TFieldDataLink;
    function GetEditorClassType: TGEEditClass; override;
  public
    property Field: TField read GetField;
    property CustomEditMask: Boolean read GetCustomEditMask write SetCustomEditMask default False;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property Edit: TDBEbEdit read GetEdit;
  end;

  TDBEditButton = class(TCustomDBEditButton)
  public
    property AutoSelected;
    property Button;
    property Field;
  published
    property CustomEditMask;
    property DataField;
    property DataSource;
    property NumbersOnly;
    property Action;
    property AutoSelect;
    property AutoSize default True;
    property Align;
    property Anchors;
    property BiDiMode;
    property BorderSpacing;
    property BorderStyle default bsNone;
    property ButtonCaption;
    property ButtonCursor;
    property ButtonHint;
    property ButtonOnlyWhenFocused;
    property ButtonWidth;
    property CharCase;
    property Color;
    property Constraints;
    property Cursor;
    property DirectInput;
    property EchoMode;
    property Enabled;
    property Flat;
    property FocusOnButtonClick;
    property Font;
    property Glyph;
//    property HideSelection;
    property Hint;
    property Layout;
    property MaxLength;
    property NumGlyphs;
    property OnButtonClick;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnContextPopup;
    property OnEditingDone;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnStartDrag;
    property OnUTF8KeyPress;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property Spacing;
    property TabOrder;
    property TabStop;
    property Text;
    property TextHint;
    property Visible;
  end;

  TDBCalcEdit = class(TCustomDBEditButton)
  private
    FDialogTitle: String;
    FCalculatorLayout: TCalculatorLayout;
    FOnAcceptValue: TAcceptValueEvent;
    FDialogPosition: TPosition;
    FDialogLeft: Integer;
    FDialogTop: Integer;
    function TitleStored: boolean;
  protected
    FCalcDialog : TForm;
    function GetDefaultGlyph: TBitmap; override;
    function GetDefaultGlyphName: String; override;
    procedure ButtonClick; override;
    procedure RunDialog; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    property AutoSelected;
    property Field;
  published
    property CustomEditMask;
    property DataField;
    property DataSource;
    // CalcEdit properties
    property CalculatorLayout : TCalculatorLayout read FCalculatorLayout write FCalculatorLayout;
    property OnAcceptValue : TAcceptValueEvent read FOnAcceptValue write FOnAcceptValue;
    property DialogTitle : String read FDialogTitle write FDialogTitle stored TitleStored;
    // TEditButton properties.
    property ButtonCaption;
    property ButtonCursor;
    property ButtonHint;
    property ButtonOnlyWhenFocused;
    property ButtonWidth;
    property Constraints;
    property DialogPosition: TPosition read FDialogPosition write FDialogPosition default poScreenCenter;
    property DialogTop: Integer read FDialogTop write FDialogTop;
    property DialogLeft: Integer read FDialogLeft write FDialogLeft;
    property DirectInput;
    property Glyph;
    property NumGlyphs;
    property Flat;
    property FocusOnButtonClick;
    // Other properties
    property Align;
    property Anchors;
    property BidiMode;
    property BorderSpacing;
    property BorderStyle;
    property AutoSize;
    property AutoSelect;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property Layout;
    property MaxLength;
    property ParentBidiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property Spacing;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnButtonClick;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditingDone;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnStartDrag;
    property OnUTF8KeyPress;
    property Text;
    property TextHint;
  end;

implementation

uses
  InterfaceBase, LCLStrConsts;

function FieldIsEditable(Field: TField): boolean;
begin
  result := (Field<>nil) and (not Field.Calculated) and
            (Field.DataType<>ftAutoInc) and (Field.FieldKind<>fkLookup)
end;

function FieldCanAcceptKey(Field: TField; AKey: char): boolean;
begin
  Result := FieldIsEditable(Field) and Field.IsValidChar(AKey);
end;

{ TDBEbEdit }

procedure TDBEbEdit.DataChange(Sender: TObject);
var
  DataLinkField: TField;
begin
  DataLinkField := FDataLink.Field;
  if DataLinkField <> nil then begin
    //use Field EditMask by default
    if not FCustomEditMask then
      EditMask := DataLinkField.EditMask;
    Alignment := DataLinkField.Alignment;

    //if we are focused its possible to edit,
    //if the field is currently modifiable
    if FFocusedDisplay and FDatalink.CanModify then begin
      //display the real text since we can modify it
      RestoreMask(DatalinkField.Text);
    end else
      //otherwise display the pretified/formated text since we can't
      DisableMask(DataLinkField.DisplayText);
    if (DataLinkField.DataType in [ftString, ftFixedChar, ftWidestring, ftFixedWideChar])
      and (MaxLength = 0) then
      MaxLength := DatalinkField.Size;
  end
  else begin
    if not FCustomEditMask then
      EditMask := '';
    Text := '';
    MaxLength := 0;
  end;
end;

procedure TDBEbEdit.UpdateData(Sender: TObject);
begin
  //the field is being updated, probably for post
  //so we are getting called to make sure its
  //up-to-date and matches any modifications
  //since its possible to have a mask for say
  //date or currency we need to make sure the
  //text is valid before we update this is in
  //case for instance they call table.post via
  //a keyboard shortcut while still focused, before
  //the changes have been validated
  ValidateEdit;
  FDataLink.Field.Text := Text;
end;

function TDBEbEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBEbEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TDBEbEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TDBEbEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBEbEdit.SetReadOnly(Value: Boolean);
begin
  inherited;
  FDataLink.ReadOnly := Value;
end;

procedure TDBEbEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBEbEdit.SetDataSource(Value: TDataSource);
begin
  ChangeDataSource(Self,FDataLink,Value);
end;

procedure TDBEbEdit.CMGetDataLink(var Message: TLMessage);
begin
  Message.Result := PtrUInt(FDataLink);
end;

{ Protected Methods}
procedure TDBEbEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key,Shift);
  case key of
    VK_ESCAPE:
      begin
        //cancel out of editing by reset on esc, but only when in editing mode
        if FDataLink.Editing then begin
          FDataLink.Reset;
          SelectAll;
          Key := VK_UNKNOWN;
        end;
      end;
    VK_DELETE, VK_BACK:
      begin
        if not FieldIsEditable(FDatalink.Field) or not FDataLink.Edit then
          Key := VK_UNKNOWN;
      end;
  end;
end;

procedure TDBEbEdit.UTF8KeyPress(var UTF8Key: TUTF8Char);
var
  CharKey: Char;
begin
  inherited UTF8KeyPress(UTF8Key);
  //If the pressed key is unicode then map the char to #255
  //Necessary to keep the TField.IsValidChar check
  if Length(UTF8Key) = 1 then
    CharKey := UTF8Key[1]
  else
    CharKey := #255;

  //handle standard keys
  if CharKey in [#32..#255] then
  begin
    if not FieldCanAcceptKey(FDataLink.Field, CharKey) or not FDatalink.Edit then
      UTF8Key := '';
  end;
end;

procedure TDBEbEdit.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  // if the datasource is being removed then we need to make sure
  // we are updated or we can get AV/Seg's *cough* as I foolishly
  // discovered firsthand....
  if (Operation=opRemove) then begin
    if (FDataLink<>nil) and (AComponent=DataSource) then
      DataSource:=nil;
  end;
end;

function TDBEbEdit.EditCanModify: Boolean;
begin
  //should follow the FieldLink for this one
  Result := FDataLink.CanModify;
end;

function TDBEbEdit.GetEditText: string;
begin
  if not (csDesigning in ComponentState) and not FDatalink.Active then begin
    Result := '';
    exit;
  end;
  Result:=inherited GetEditText;
end;

procedure TDBEbEdit.Change;
begin
  //need to override this to make sure the datalink gets notified
  //its been modified, then when post etc, it will call
  //updatedata to update the field data with current value
  if not FKillFocus then
    FDataLink.Modified;

  inherited Change;
end;

procedure TDBEbEdit.Reset;
begin
  //need to override this to make sure the datalink gets reset
  //if the changes get canceled
  FDataLink.reset;

  inherited Reset;
end;

procedure TDBEbEdit.WMSetFocus(var Message: TLMSetFocus);
var
  EditOnFocus: Boolean;
begin
  // update text before inherited so DoEnter has the new text
  if not FFocusedDisplay then
  begin
    FFocusedDisplay := True;
    // some widgetsets do not notify clipboard actions properly. Put at edit state at entry
    EditOnFocus := WidgetSet.GetLCLCapability(lcReceivesLMClearCutCopyPasteReliably) = LCL_CAPABILITY_NO;
    if EditOnFocus then
    begin
      if FDataLink.Edit then
        RestoreMask(FDataLink.Field.Text);
    end
    else
      FDataLink.Reset;
  end;
  inherited WMSetFocus(Message);
end;

procedure TDBEbEdit.WMKillFocus(var Message: TLMKillFocus);
begin
  inherited WMKillFocus(Message);

  FFocusedDisplay := False;

  if FDatalink.Editing then
  begin
    FDatalink.UpdateRecord;
    //check for Focused before disabling the mask since SetFocus can be called
    //inside events propagated by WMKillFocus or UpdateRecord
    if not Focused then
    begin
      FKillFocus := True;
      DisableMask(FDataLink.Field.DisplayText);
      ////reset the modified flag that is changed after setting the text
      //TEbFieldDataLink(FDataLink).IsModified := False;
      FKillFocus := False;
    end;
  end
  else
    FDatalink.Reset;
end;

procedure TDBEbEdit.WndProc(var Message: TLMessage);
begin
  case Message.Msg of
    LM_CLEAR,
    LM_CUT,
    LM_PASTE:
      begin
        if FDataLink.CanModify then
        begin
          //LCL changes the Text before LM_PASTE is called and not after like Delphi. Issue 20330
          //When Edit is called the Text property is reset to the previous value
          //Add a workaround while bug is not fixed
          FDataLink.OnDataChange := nil;
          FDatalink.Edit;
          FDataLink.Modified;
          FDataLink.OnDataChange := @DataChange;
          inherited WndProc(Message);
        end;
      end;
    else
      inherited WndProc(Message);
  end;
end;

{ Public Methods }
constructor TDBEbEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FKillFocus := False;
  FDataLink.OnDataChange := @DataChange;
  FDataLink.OnUpdateData := @UpdateData;
end;

destructor TDBEbEdit.Destroy;
begin
  FDataLink.Destroy;
  inherited Destroy;
end;

function TDBEbEdit.ExecuteAction(AAction: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(AAction) or
            (FDataLink <> nil) and FDataLink.ExecuteAction(AAction);
end;

function TDBEbEdit.UpdateAction(AAction: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(AAction) or
            (FDataLink <> nil) and FDataLink.UpdateAction(AAction);
end;

{ TCustomDBEditButton }

function TCustomDBEditButton.GetReadOnly: Boolean;
begin
  Result := Edit.ReadOnly;
end;

procedure TCustomDBEditButton.SetReadOnly(AValue: Boolean);
begin
  Edit.ReadOnly := AValue;
end;

function TCustomDBEditButton.GetFieldDataLink: TFieldDataLink;
begin
  Result := Edit.FDataLink;
end;

function TCustomDBEditButton.GetCustomEditMask: Boolean;
begin
  Result := Edit.CustomEditMask;
end;

function TCustomDBEditButton.GetDataField: string;
begin
  Result := Edit.DataField;
end;

function TCustomDBEditButton.GetDataSource: TDataSource;
begin
  Result := Edit.DataSource;
end;

function TCustomDBEditButton.GetEdit: TDBEbEdit;
begin
  Result := TDBEbEdit(BaseEditor);
end;

function TCustomDBEditButton.GetField: TField;
begin
  Result := Edit.Field;
end;

procedure TCustomDBEditButton.SetCustomEditMask(AValue: Boolean);
begin
  Edit.CustomEditMask := AValue;
end;

procedure TCustomDBEditButton.SetDataField(AValue: string);
begin
  Edit.DataField := AValue;
end;

procedure TCustomDBEditButton.SetDataSource(AValue: TDataSource);
begin
  Edit.DataSource := AValue;
end;

function TCustomDBEditButton.GetEditorClassType: TGEEditClass;
begin
  Result := TDBEbEdit;
end;

{ TDBCalcEdit }

function TDBCalcEdit.GetDefaultGlyph: TBitmap;
begin
  Result := CalcGlyph;
end;

function TDBCalcEdit.GetDefaultGlyphName: String;
begin
  Result := ResBtnCalculator;
end;

function TDBCalcEdit.TitleStored: boolean;
begin
  Result:=FDialogTitle<>rsCalculator;
end;

procedure TDBCalcEdit.ButtonClick;
begin
  inherited ButtonClick;
  RunDialog;
  //Do this after the dialog, otherwise it just looks silly
  if FocusOnButtonClick then FocusAndMaybeSelectAll;
end;

procedure TDBCalcEdit.RunDialog;
var
  D : Double;
  B : Boolean;
  Dlg: TCalculatorForm;
begin
  D:=Field.AsFloat;
  Dlg := CreateCalculatorForm(Self,FCalculatorLayout,0);
  with Dlg do
    try
      Caption:=DialogTitle;
      Value:=D;
      Dlg.Top := FDialogTop;
      Dlg.Left := FDialogLeft;
      Dlg.Position := FDialogPosition;
      if (ShowModal=mrOK) and EditCanModify then
      begin
        D:=Value;
        B:=True;
        If Assigned(FOnAcceptValue) then
          FOnAcceptValue(Self,D,B);
        if B then
        begin
          with GetFieldDataLink do
          begin
            Edit;
            Modified;
          end;
          Field.AsFloat:=D;
        end;
      end;
    finally
      Free;
    end;
end;

constructor TDBCalcEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDialogTitle:=rsCalculator;
  FDialogPosition := poScreenCenter;
end;

end.

