unit GridTestu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.StdCtrls,

  CWSSettingsPanel,
  CWSButton,
  CWSComboBox,
  CWSMemo,

  RzStatus,
  RzPanel,
  RzLabel,

  SVGIconImageListBase,
  SVGIconImageList,

  BaseFormu,
  EmailProcessoru,
  Mainu, DMMainu, Vcl.Grids, vcl.wwdbigrd, vcl.wwdbgrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.Stan.Async,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, scControls, scGrids, scDBGrids,
  CWSDBGrid;

type
  TfrmGridTest = class(TfrmBase)
    FDTableAdapter1: TFDTableAdapter;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    FDCommand1: TFDCommand;
    FDConnection1: TFDConnection;
    grid1: TwwDBGrid;
    CWSDBGrid1: TCWSDBGrid;
    procedure FormShow(Sender: TObject);
  private
  public
  protected
    procedure ApplyTheme; override;
  end;

var
  frmGridTest: TfrmGridTest;

implementation

uses
  System.IOUtils,
  CWSFluentColorsMulti,
  RzCommon,

  Constsu,
  Utilsu;

{$R *.dfm}

procedure TfrmGridTest.FormShow(Sender: TObject);
begin
  inherited;
  FDMemTable1.Active := True;
end;

procedure TfrmGridTest.ApplyTheme;
begin
  Self.Color := flNeutralBackground1;

    grid1.LineColors.DataColor := clYellow;
    //grid1.Color := clBlue;
  //grid1.LineColors.DataColor := flNeutralStroke1;
  //grid1.Font.Color := flNeutralForeground3;
  //grid1.TitleFont.Color := flNeutralForeground3;
  //grid1.TitleColor := flNeutralBackground3;
end;

end.
