; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/safe/BufferOverFlow_Integer_Addr_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/safe/BufferOverFlow_Integer_Addr_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.TagOoooAttInfo = type { i16, i16, %struct.anon.1 }
%struct.anon.1 = type { i8 }
%struct.TagOoooProMsgHead = type { %union.TagOoooProTcIdField, %union.TagOoooProMsgTypeFiled, i8, i16, i8, i8 }
%union.TagOoooProTcIdField = type { i16 }
%union.TagOoooProMsgTypeFiled = type { i8 }
%struct.anon.0 = type { i8 }
%struct.TagOmciProMsgSet = type { [30 x i8] }

@g_astAttInfo = global [2 x [399 x [17 x %struct.TagOoooAttInfo]]] zeroinitializer, align 16, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @OoooXxxGetAttByMsgSeq(i64 noundef %ulPortId, i8* noundef %pInOoooMsg, i8 noundef zeroext %ucAttSeq, i8* noundef %pOutAtt) #0 !dbg !77 {
entry:
  %ulPortId.addr = alloca i64, align 8
  %pInOoooMsg.addr = alloca i8*, align 8
  %ucAttSeq.addr = alloca i8, align 1
  %pOutAtt.addr = alloca i8*, align 8
  %pucMsgContent = alloca i8*, align 8
  %usMe = alloca i16, align 2
  %usConvertId = alloca i16, align 2
  %usAttOffset = alloca i16, align 2
  %usAttSize = alloca i16, align 2
  %ucMsgType = alloca i8, align 1
  store i64 %ulPortId, i64* %ulPortId.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %ulPortId.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* %pInOoooMsg, i8** %pInOoooMsg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pInOoooMsg.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8 %ucAttSeq, i8* %ucAttSeq.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %ucAttSeq.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* %pOutAtt, i8** %pOutAtt.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pOutAtt.addr, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i8** %pucMsgContent, metadata !92, metadata !DIExpression()), !dbg !94
  store i8* null, i8** %pucMsgContent, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i16* %usMe, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i16* %usConvertId, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i16* %usAttOffset, metadata !99, metadata !DIExpression()), !dbg !100
  store i16 0, i16* %usAttOffset, align 2, !dbg !100
  call void @llvm.dbg.declare(metadata i16* %usAttSize, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i8* %ucMsgType, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = load i8*, i8** %pInOoooMsg.addr, align 8, !dbg !105
  %1 = bitcast i8* %0 to %struct.TagOoooProMsgHead*, !dbg !105
  %uMsgType = getelementptr inbounds %struct.TagOoooProMsgHead, %struct.TagOoooProMsgHead* %1, i32 0, i32 1, !dbg !105
  %stMsgType = bitcast %union.TagOoooProMsgTypeFiled* %uMsgType to %struct.anon.0*, !dbg !105
  %2 = bitcast %struct.anon.0* %stMsgType to i8*, !dbg !105
  %bf.load = load i8, i8* %2, align 2, !dbg !105
  %bf.clear = and i8 %bf.load, 31, !dbg !105
  store i8 %bf.clear, i8* %ucMsgType, align 1, !dbg !106
  %3 = load i8, i8* %ucMsgType, align 1, !dbg !107
  %conv = zext i8 %3 to i32, !dbg !107
  switch i32 %conv, label %sw.default [
    i32 4, label %sw.bb
    i32 8, label %sw.bb5
  ], !dbg !108

sw.bb:                                            ; preds = %entry
  %4 = load i64, i64* %ulPortId.addr, align 8, !dbg !109
  %arrayidx = getelementptr inbounds [2 x [399 x [17 x %struct.TagOoooAttInfo]]], [2 x [399 x [17 x %struct.TagOoooAttInfo]]]* @g_astAttInfo, i64 0, i64 %4, !dbg !109
  %5 = load i16, i16* %usConvertId, align 2, !dbg !109
  %idxprom = zext i16 %5 to i64, !dbg !109
  %arrayidx1 = getelementptr inbounds [399 x [17 x %struct.TagOoooAttInfo]], [399 x [17 x %struct.TagOoooAttInfo]]* %arrayidx, i64 0, i64 %idxprom, !dbg !109
  %6 = load i8, i8* %ucAttSeq.addr, align 1, !dbg !109
  %idxprom2 = zext i8 %6 to i64, !dbg !109
  %arrayidx3 = getelementptr inbounds [17 x %struct.TagOoooAttInfo], [17 x %struct.TagOoooAttInfo]* %arrayidx1, i64 0, i64 %idxprom2, !dbg !109
  %usAttSize4 = getelementptr inbounds %struct.TagOoooAttInfo, %struct.TagOoooAttInfo* %arrayidx3, i32 0, i32 0, !dbg !109
  %7 = load i16, i16* %usAttSize4, align 2, !dbg !109
  store i16 %7, i16* %usAttSize, align 2, !dbg !111
  br label %sw.epilog, !dbg !112

sw.bb5:                                           ; preds = %entry
  %8 = load i8*, i8** %pInOoooMsg.addr, align 8, !dbg !113
  %9 = bitcast i8* %8 to %struct.TagOmciProMsgSet*, !dbg !113
  %aucMsgContent = getelementptr inbounds %struct.TagOmciProMsgSet, %struct.TagOmciProMsgSet* %9, i32 0, i32 0, !dbg !113
  %arraydecay = getelementptr inbounds [30 x i8], [30 x i8]* %aucMsgContent, i64 0, i64 0, !dbg !113
  store i8* %arraydecay, i8** %pucMsgContent, align 8, !dbg !114
  store i16 0, i16* %usAttOffset, align 2, !dbg !115
  %10 = load i64, i64* %ulPortId.addr, align 8, !dbg !116
  %arrayidx6 = getelementptr inbounds [2 x [399 x [17 x %struct.TagOoooAttInfo]]], [2 x [399 x [17 x %struct.TagOoooAttInfo]]]* @g_astAttInfo, i64 0, i64 %10, !dbg !116
  %11 = load i16, i16* %usConvertId, align 2, !dbg !116
  %idxprom7 = zext i16 %11 to i64, !dbg !116
  %arrayidx8 = getelementptr inbounds [399 x [17 x %struct.TagOoooAttInfo]], [399 x [17 x %struct.TagOoooAttInfo]]* %arrayidx6, i64 0, i64 %idxprom7, !dbg !116
  %12 = load i8, i8* %ucAttSeq.addr, align 1, !dbg !116
  %idxprom9 = zext i8 %12 to i64, !dbg !116
  %arrayidx10 = getelementptr inbounds [17 x %struct.TagOoooAttInfo], [17 x %struct.TagOoooAttInfo]* %arrayidx8, i64 0, i64 %idxprom9, !dbg !116
  %usAttSize11 = getelementptr inbounds %struct.TagOoooAttInfo, %struct.TagOoooAttInfo* %arrayidx10, i32 0, i32 0, !dbg !116
  %13 = load i16, i16* %usAttSize11, align 2, !dbg !116
  store i16 %13, i16* %usAttSize, align 2, !dbg !117
  %14 = load i16, i16* %usMe, align 2, !dbg !118
  %conv12 = zext i16 %14 to i32, !dbg !118
  %cmp = icmp eq i32 75, %conv12, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %sw.bb5
  store i16 21, i16* %usAttSize, align 2, !dbg !122
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %sw.bb5
  br label %sw.epilog, !dbg !125

sw.default:                                       ; preds = %entry
  br label %sw.epilog, !dbg !126

sw.epilog:                                        ; preds = %sw.default, %if.end, %sw.bb
  %15 = load i8*, i8** %pucMsgContent, align 8, !dbg !127
  %cmp14 = icmp ne i8* null, %15, !dbg !129
  br i1 %cmp14, label %if.then16, label %if.else, !dbg !130

if.then16:                                        ; preds = %sw.epilog
  %16 = load i8*, i8** %pOutAtt.addr, align 8, !dbg !131
  %17 = load i16, i16* %usAttSize, align 2, !dbg !133
  %conv17 = zext i16 %17 to i32, !dbg !133
  %18 = load i8*, i8** %pucMsgContent, align 8, !dbg !134
  %19 = load i16, i16* %usAttOffset, align 2, !dbg !135
  %conv18 = zext i16 %19 to i32, !dbg !135
  %idx.ext = sext i32 %conv18 to i64, !dbg !136
  %add.ptr = getelementptr inbounds i8, i8* %18, i64 %idx.ext, !dbg !136
  %20 = load i16, i16* %usAttSize, align 2, !dbg !137
  %conv19 = zext i16 %20 to i32, !dbg !137
  %call = call i32 (i8*, i32, i8*, i32, ...) bitcast (i32 (...)* @memcpy_s to i32 (i8*, i32, i8*, i32, ...)*)(i8* noundef %16, i32 noundef %conv17, i8* noundef %add.ptr, i32 noundef %conv19), !dbg !138
  br label %if.end20, !dbg !139

if.else:                                          ; preds = %sw.epilog
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then16
  ret void, !dbg !140
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @memcpy_s(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @OoooMyInvoke(i64 noundef %ulPortId, i8* noundef %pInOoooMsg) #0 !dbg !141 {
entry:
  %ulPortId.addr = alloca i64, align 8
  %pInOoooMsg.addr = alloca i8*, align 8
  %ucXxThreshold = alloca i8, align 1
  store i64 %ulPortId, i64* %ulPortId.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %ulPortId.addr, metadata !144, metadata !DIExpression()), !dbg !145
  store i8* %pInOoooMsg, i8** %pInOoooMsg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pInOoooMsg.addr, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i8* %ucXxThreshold, metadata !148, metadata !DIExpression()), !dbg !149
  store i8 0, i8* %ucXxThreshold, align 1, !dbg !149
  %0 = load i64, i64* %ulPortId.addr, align 8, !dbg !150
  %1 = load i8*, i8** %pInOoooMsg.addr, align 8, !dbg !151
  call void @OoooXxxGetAttByMsgSeq(i64 noundef %0, i8* noundef %1, i8 noundef zeroext 6, i8* noundef %ucXxThreshold), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !154 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !161, metadata !DIExpression()), !dbg !162
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !163, metadata !DIExpression()), !dbg !164
  %0 = load i32, i32* %argc.addr, align 4, !dbg !165
  %cmp = icmp slt i32 %0, 3, !dbg !167
  br i1 %cmp, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !169
  br label %return, !dbg !169

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %argc.addr, align 4, !dbg !171
  %conv = sext i32 %1 to i64, !dbg !171
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !172
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 2, !dbg !172
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !172
  call void @OoooMyInvoke(i64 noundef %conv, i8* noundef %3), !dbg !173
  store i32 0, i32* %retval, align 4, !dbg !174
  br label %return, !dbg !174

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !175
  ret i32 %4, !dbg !175
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!70, !71, !72, !73, !74, !75}
!llvm.ident = !{!76}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g_astAttInfo", scope: !2, file: !6, line: 68, type: !55, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !54, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/safe/BufferOverFlow_Integer_Addr_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "EnuOoooEntityType", file: !6, line: 19, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "safe/BufferOverFlow_Integer_Addr_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "OOOO_PRO_ME_IP_STATIC_ROUTES_TAG", value: 75)
!10 = !DIEnumerator(name: "OOOO_PRO_ME_ENTITY_MAX", value: 399)
!11 = !{!12, !46}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "OoooProMsgHeadStru", file: !6, line: 53, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "TagOoooProMsgHead", file: !6, line: 46, size: 64, elements: !15)
!15 = !{!16, !28, !42, !43, !44, !45}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "uTcid", scope: !14, file: !6, line: 47, baseType: !17, size: 16)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "OoooProTcidFieldU", file: !6, line: 32, baseType: !18)
!18 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "TagOoooProTcIdField", file: !6, line: 26, size: 16, elements: !19)
!19 = !{!20, !23}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "usTcId", scope: !18, file: !6, line: 27, baseType: !21, size: 16)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "USHORT", file: !6, line: 11, baseType: !22)
!22 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "stTcId", scope: !18, file: !6, line: 31, baseType: !24, size: 16)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !18, file: !6, line: 28, size: 16, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "usSn", scope: !24, file: !6, line: 29, baseType: !21, size: 15, flags: DIFlagBitField, extraData: i64 0)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "usPri", scope: !24, file: !6, line: 30, baseType: !21, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 0)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "uMsgType", scope: !14, file: !6, line: 48, baseType: !29, size: 8, offset: 16)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "OoooProMsgTypeFieldU", file: !6, line: 44, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "TagOoooProMsgTypeFiled", file: !6, line: 35, size: 8, elements: !31)
!31 = !{!32, !35}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "ucMsgType", scope: !30, file: !6, line: 36, baseType: !33, size: 8)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "UCHAR", file: !6, line: 9, baseType: !34)
!34 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "stMsgType", scope: !30, file: !6, line: 43, baseType: !36, size: 8)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !30, file: !6, line: 38, size: 8, elements: !37)
!37 = !{!38, !39, !40, !41}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "ucMt", scope: !36, file: !6, line: 39, baseType: !33, size: 5, flags: DIFlagBitField, extraData: i64 0)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "ucAk", scope: !36, file: !6, line: 40, baseType: !33, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "ucAr", scope: !36, file: !6, line: 41, baseType: !33, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "ucDb", scope: !36, file: !6, line: 42, baseType: !33, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "ucDeviceId", scope: !14, file: !6, line: 49, baseType: !33, size: 8, offset: 24)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "usEntityclass", scope: !14, file: !6, line: 50, baseType: !21, size: 16, offset: 32)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "ucInstanceH", scope: !14, file: !6, line: 51, baseType: !33, size: 8, offset: 48)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "ucInstanceL", scope: !14, file: !6, line: 52, baseType: !33, size: 8, offset: 56)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "OoooProMsgSetStru", file: !6, line: 77, baseType: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "TagOmciProMsgSet", file: !6, line: 75, size: 240, elements: !49)
!49 = !{!50}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "aucMsgContent", scope: !48, file: !6, line: 76, baseType: !51, size: 240)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 240, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 30)
!54 = !{!0}
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 651168, elements: !66)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "OoooAttInfoStru", file: !6, line: 64, baseType: !57)
!57 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "TagOoooAttInfo", file: !6, line: 57, size: 48, elements: !58)
!58 = !{!59, !60, !61}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "usAttSize", scope: !57, file: !6, line: 58, baseType: !21, size: 16)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "usOffset", scope: !57, file: !6, line: 59, baseType: !21, size: 16, offset: 16)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "stSupportFlag", scope: !57, file: !6, line: 63, baseType: !62, size: 8, offset: 32)
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !57, file: !6, line: 60, size: 8, elements: !63)
!63 = !{!64, !65}
!64 = !DIDerivedType(tag: DW_TAG_member, name: "ucSupportFlag", scope: !62, file: !6, line: 61, baseType: !33, size: 4, flags: DIFlagBitField, extraData: i64 0)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "ucOperateAtt", scope: !62, file: !6, line: 62, baseType: !33, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!66 = !{!67, !68, !69}
!67 = !DISubrange(count: 2)
!68 = !DISubrange(count: 399)
!69 = !DISubrange(count: 17)
!70 = !{i32 7, !"Dwarf Version", i32 4}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 4}
!73 = !{i32 7, !"PIC Level", i32 2}
!74 = !{i32 7, !"uwtable", i32 1}
!75 = !{i32 7, !"frame-pointer", i32 2}
!76 = !{!"Homebrew clang version 14.0.6"}
!77 = distinct !DISubprogram(name: "OoooXxxGetAttByMsgSeq", scope: !6, file: !6, line: 84, type: !78, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !83)
!78 = !DISubroutineType(types: !79)
!79 = !{null, !80, !82, !33, !82}
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "ULONG", file: !6, line: 10, baseType: !81)
!81 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!83 = !{}
!84 = !DILocalVariable(name: "ulPortId", arg: 1, scope: !77, file: !6, line: 84, type: !80)
!85 = !DILocation(line: 84, column: 34, scope: !77)
!86 = !DILocalVariable(name: "pInOoooMsg", arg: 2, scope: !77, file: !6, line: 84, type: !82)
!87 = !DILocation(line: 84, column: 50, scope: !77)
!88 = !DILocalVariable(name: "ucAttSeq", arg: 3, scope: !77, file: !6, line: 84, type: !33)
!89 = !DILocation(line: 84, column: 68, scope: !77)
!90 = !DILocalVariable(name: "pOutAtt", arg: 4, scope: !77, file: !6, line: 84, type: !82)
!91 = !DILocation(line: 84, column: 84, scope: !77)
!92 = !DILocalVariable(name: "pucMsgContent", scope: !77, file: !6, line: 86, type: !93)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!94 = !DILocation(line: 86, column: 14, scope: !77)
!95 = !DILocalVariable(name: "usMe", scope: !77, file: !6, line: 87, type: !21)
!96 = !DILocation(line: 87, column: 13, scope: !77)
!97 = !DILocalVariable(name: "usConvertId", scope: !77, file: !6, line: 88, type: !21)
!98 = !DILocation(line: 88, column: 13, scope: !77)
!99 = !DILocalVariable(name: "usAttOffset", scope: !77, file: !6, line: 89, type: !21)
!100 = !DILocation(line: 89, column: 13, scope: !77)
!101 = !DILocalVariable(name: "usAttSize", scope: !77, file: !6, line: 90, type: !21)
!102 = !DILocation(line: 90, column: 13, scope: !77)
!103 = !DILocalVariable(name: "ucMsgType", scope: !77, file: !6, line: 91, type: !33)
!104 = !DILocation(line: 91, column: 13, scope: !77)
!105 = !DILocation(line: 94, column: 17, scope: !77)
!106 = !DILocation(line: 94, column: 15, scope: !77)
!107 = !DILocation(line: 96, column: 13, scope: !77)
!108 = !DILocation(line: 96, column: 5, scope: !77)
!109 = !DILocation(line: 98, column: 25, scope: !110)
!110 = distinct !DILexicalBlock(scope: !77, file: !6, line: 96, column: 24)
!111 = !DILocation(line: 98, column: 23, scope: !110)
!112 = !DILocation(line: 99, column: 13, scope: !110)
!113 = !DILocation(line: 102, column: 29, scope: !110)
!114 = !DILocation(line: 102, column: 27, scope: !110)
!115 = !DILocation(line: 103, column: 25, scope: !110)
!116 = !DILocation(line: 104, column: 25, scope: !110)
!117 = !DILocation(line: 104, column: 23, scope: !110)
!118 = !DILocation(line: 106, column: 53, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !6, line: 106, column: 17)
!120 = !DILocation(line: 106, column: 50, scope: !119)
!121 = !DILocation(line: 106, column: 17, scope: !110)
!122 = !DILocation(line: 107, column: 27, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !6, line: 106, column: 59)
!124 = !DILocation(line: 108, column: 13, scope: !123)
!125 = !DILocation(line: 110, column: 13, scope: !110)
!126 = !DILocation(line: 112, column: 13, scope: !110)
!127 = !DILocation(line: 116, column: 14, scope: !128)
!128 = distinct !DILexicalBlock(scope: !77, file: !6, line: 116, column: 9)
!129 = !DILocation(line: 116, column: 11, scope: !128)
!130 = !DILocation(line: 116, column: 9, scope: !77)
!131 = !DILocation(line: 118, column: 18, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !6, line: 116, column: 29)
!133 = !DILocation(line: 118, column: 27, scope: !132)
!134 = !DILocation(line: 118, column: 38, scope: !132)
!135 = !DILocation(line: 118, column: 54, scope: !132)
!136 = !DILocation(line: 118, column: 52, scope: !132)
!137 = !DILocation(line: 118, column: 67, scope: !132)
!138 = !DILocation(line: 118, column: 9, scope: !132)
!139 = !DILocation(line: 119, column: 5, scope: !132)
!140 = !DILocation(line: 122, column: 1, scope: !77)
!141 = distinct !DISubprogram(name: "OoooMyInvoke", scope: !6, file: !6, line: 126, type: !142, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !83)
!142 = !DISubroutineType(types: !143)
!143 = !{null, !80, !82}
!144 = !DILocalVariable(name: "ulPortId", arg: 1, scope: !141, file: !6, line: 126, type: !80)
!145 = !DILocation(line: 126, column: 25, scope: !141)
!146 = !DILocalVariable(name: "pInOoooMsg", arg: 2, scope: !141, file: !6, line: 126, type: !82)
!147 = !DILocation(line: 126, column: 41, scope: !141)
!148 = !DILocalVariable(name: "ucXxThreshold", scope: !141, file: !6, line: 128, type: !33)
!149 = !DILocation(line: 128, column: 13, scope: !141)
!150 = !DILocation(line: 130, column: 27, scope: !141)
!151 = !DILocation(line: 130, column: 37, scope: !141)
!152 = !DILocation(line: 130, column: 5, scope: !141)
!153 = !DILocation(line: 131, column: 1, scope: !141)
!154 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 133, type: !155, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !83)
!155 = !DISubroutineType(types: !156)
!156 = !{!157, !157, !158}
!157 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!160 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!161 = !DILocalVariable(name: "argc", arg: 1, scope: !154, file: !6, line: 133, type: !157)
!162 = !DILocation(line: 133, column: 14, scope: !154)
!163 = !DILocalVariable(name: "argv", arg: 2, scope: !154, file: !6, line: 133, type: !158)
!164 = !DILocation(line: 133, column: 26, scope: !154)
!165 = !DILocation(line: 135, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !154, file: !6, line: 135, column: 9)
!167 = !DILocation(line: 135, column: 14, scope: !166)
!168 = !DILocation(line: 135, column: 9, scope: !154)
!169 = !DILocation(line: 136, column: 9, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !6, line: 135, column: 19)
!171 = !DILocation(line: 139, column: 18, scope: !154)
!172 = !DILocation(line: 139, column: 24, scope: !154)
!173 = !DILocation(line: 139, column: 5, scope: !154)
!174 = !DILocation(line: 140, column: 5, scope: !154)
!175 = !DILocation(line: 141, column: 1, scope: !154)
