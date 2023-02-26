; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE126_Buffer_Overread__char_declare_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data4 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !40
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx2, align 1, !dbg !42
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store i8* %arraydecay3, i8** %data, align 8, !dbg !44
  %0 = load i8*, i8** %data, align 8, !dbg !45
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !46
  store i8* %0, i8** %unionFirst, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !48, metadata !DIExpression()), !dbg !50
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !51
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !51
  store i8* %1, i8** %data4, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !62, metadata !DIExpression()), !dbg !63
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !64
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx6, align 1, !dbg !66
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !68
  store i64 %call, i64* %destLen, align 8, !dbg !69
  store i64 0, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !73
  %3 = load i64, i64* %destLen, align 8, !dbg !75
  %cmp = icmp ult i64 %2, %3, !dbg !76
  br i1 %cmp, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data4, align 8, !dbg !78
  %5 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx8 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !78
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !78
  %7 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !82
  store i8 %6, i8* %arrayidx9, align 1, !dbg !83
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !85
  %inc = add i64 %8, 1, !dbg !85
  store i64 %inc, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx10, align 1, !dbg !91
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  call void @printLine(i8* noundef %arraydecay11), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_34_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* noundef null), !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 noundef %conv), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__char_declare_loop_34_good(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE126_Buffer_Overread__char_declare_loop_34_bad(), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data4 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !126
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !129
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx2, align 1, !dbg !131
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !132
  store i8* %arraydecay3, i8** %data, align 8, !dbg !133
  %0 = load i8*, i8** %data, align 8, !dbg !134
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !135
  store i8* %0, i8** %unionFirst, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !137, metadata !DIExpression()), !dbg !139
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !140
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !140
  store i8* %1, i8** %data4, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !148
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !149
  store i8 0, i8* %arrayidx6, align 1, !dbg !150
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !151
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !152
  store i64 %call, i64* %destLen, align 8, !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !157
  %3 = load i64, i64* %destLen, align 8, !dbg !159
  %cmp = icmp ult i64 %2, %3, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data4, align 8, !dbg !162
  %5 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx8 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !162
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !162
  %7 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !166
  store i8 %6, i8* %arrayidx9, align 1, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %8, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !173
  store i8 0, i8* %arrayidx10, align 1, !dbg !174
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !175
  call void @printLine(i8* noundef %arraydecay11), !dbg !176
  ret void, !dbg !177
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 31, column: 12, scope: !11)
!20 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__char_declare_loop_34_unionType", file: !12, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !12, line: 23, baseType: !17, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !12, line: 24, baseType: !17, size: 64)
!26 = !DILocation(line: 32, column: 60, scope: !11)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 33, column: 10, scope: !11)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 34, column: 10, scope: !11)
!37 = !DILocation(line: 35, column: 5, scope: !11)
!38 = !DILocation(line: 36, column: 5, scope: !11)
!39 = !DILocation(line: 36, column: 25, scope: !11)
!40 = !DILocation(line: 37, column: 5, scope: !11)
!41 = !DILocation(line: 38, column: 5, scope: !11)
!42 = !DILocation(line: 38, column: 27, scope: !11)
!43 = !DILocation(line: 40, column: 12, scope: !11)
!44 = !DILocation(line: 40, column: 10, scope: !11)
!45 = !DILocation(line: 41, column: 26, scope: !11)
!46 = !DILocation(line: 41, column: 13, scope: !11)
!47 = !DILocation(line: 41, column: 24, scope: !11)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 43, type: !17)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!50 = !DILocation(line: 43, column: 16, scope: !49)
!51 = !DILocation(line: 43, column: 31, scope: !49)
!52 = !DILocalVariable(name: "i", scope: !53, file: !12, line: 45, type: !54)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 44, column: 9)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 31, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !57, line: 94, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!58 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 45, column: 20, scope: !53)
!60 = !DILocalVariable(name: "destLen", scope: !53, file: !12, line: 45, type: !54)
!61 = !DILocation(line: 45, column: 23, scope: !53)
!62 = !DILocalVariable(name: "dest", scope: !53, file: !12, line: 46, type: !33)
!63 = !DILocation(line: 46, column: 18, scope: !53)
!64 = !DILocation(line: 47, column: 13, scope: !53)
!65 = !DILocation(line: 48, column: 13, scope: !53)
!66 = !DILocation(line: 48, column: 25, scope: !53)
!67 = !DILocation(line: 49, column: 30, scope: !53)
!68 = !DILocation(line: 49, column: 23, scope: !53)
!69 = !DILocation(line: 49, column: 21, scope: !53)
!70 = !DILocation(line: 52, column: 20, scope: !71)
!71 = distinct !DILexicalBlock(scope: !53, file: !12, line: 52, column: 13)
!72 = !DILocation(line: 52, column: 18, scope: !71)
!73 = !DILocation(line: 52, column: 25, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !12, line: 52, column: 13)
!75 = !DILocation(line: 52, column: 29, scope: !74)
!76 = !DILocation(line: 52, column: 27, scope: !74)
!77 = !DILocation(line: 52, column: 13, scope: !71)
!78 = !DILocation(line: 54, column: 27, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !12, line: 53, column: 13)
!80 = !DILocation(line: 54, column: 32, scope: !79)
!81 = !DILocation(line: 54, column: 22, scope: !79)
!82 = !DILocation(line: 54, column: 17, scope: !79)
!83 = !DILocation(line: 54, column: 25, scope: !79)
!84 = !DILocation(line: 55, column: 13, scope: !79)
!85 = !DILocation(line: 52, column: 39, scope: !74)
!86 = !DILocation(line: 52, column: 13, scope: !74)
!87 = distinct !{!87, !77, !88, !89}
!88 = !DILocation(line: 55, column: 13, scope: !71)
!89 = !{!"llvm.loop.mustprogress"}
!90 = !DILocation(line: 56, column: 13, scope: !53)
!91 = !DILocation(line: 56, column: 25, scope: !53)
!92 = !DILocation(line: 57, column: 23, scope: !53)
!93 = !DILocation(line: 57, column: 13, scope: !53)
!94 = !DILocation(line: 60, column: 1, scope: !11)
!95 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_34_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!96 = !DILocation(line: 102, column: 5, scope: !95)
!97 = !DILocation(line: 103, column: 1, scope: !95)
!98 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 114, type: !99, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DISubroutineType(types: !100)
!100 = !{!101, !101, !102}
!101 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !12, line: 114, type: !101)
!104 = !DILocation(line: 114, column: 14, scope: !98)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !12, line: 114, type: !102)
!106 = !DILocation(line: 114, column: 27, scope: !98)
!107 = !DILocation(line: 117, column: 22, scope: !98)
!108 = !DILocation(line: 117, column: 12, scope: !98)
!109 = !DILocation(line: 117, column: 5, scope: !98)
!110 = !DILocation(line: 119, column: 5, scope: !98)
!111 = !DILocation(line: 120, column: 5, scope: !98)
!112 = !DILocation(line: 121, column: 5, scope: !98)
!113 = !DILocation(line: 124, column: 5, scope: !98)
!114 = !DILocation(line: 125, column: 5, scope: !98)
!115 = !DILocation(line: 126, column: 5, scope: !98)
!116 = !DILocation(line: 128, column: 5, scope: !98)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!118 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 69, type: !17)
!119 = !DILocation(line: 69, column: 12, scope: !117)
!120 = !DILocalVariable(name: "myUnion", scope: !117, file: !12, line: 70, type: !21)
!121 = !DILocation(line: 70, column: 60, scope: !117)
!122 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !12, line: 71, type: !28)
!123 = !DILocation(line: 71, column: 10, scope: !117)
!124 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !12, line: 72, type: !33)
!125 = !DILocation(line: 72, column: 10, scope: !117)
!126 = !DILocation(line: 73, column: 5, scope: !117)
!127 = !DILocation(line: 74, column: 5, scope: !117)
!128 = !DILocation(line: 74, column: 25, scope: !117)
!129 = !DILocation(line: 75, column: 5, scope: !117)
!130 = !DILocation(line: 76, column: 5, scope: !117)
!131 = !DILocation(line: 76, column: 27, scope: !117)
!132 = !DILocation(line: 78, column: 12, scope: !117)
!133 = !DILocation(line: 78, column: 10, scope: !117)
!134 = !DILocation(line: 79, column: 26, scope: !117)
!135 = !DILocation(line: 79, column: 13, scope: !117)
!136 = !DILocation(line: 79, column: 24, scope: !117)
!137 = !DILocalVariable(name: "data", scope: !138, file: !12, line: 81, type: !17)
!138 = distinct !DILexicalBlock(scope: !117, file: !12, line: 80, column: 5)
!139 = !DILocation(line: 81, column: 16, scope: !138)
!140 = !DILocation(line: 81, column: 31, scope: !138)
!141 = !DILocalVariable(name: "i", scope: !142, file: !12, line: 83, type: !54)
!142 = distinct !DILexicalBlock(scope: !138, file: !12, line: 82, column: 9)
!143 = !DILocation(line: 83, column: 20, scope: !142)
!144 = !DILocalVariable(name: "destLen", scope: !142, file: !12, line: 83, type: !54)
!145 = !DILocation(line: 83, column: 23, scope: !142)
!146 = !DILocalVariable(name: "dest", scope: !142, file: !12, line: 84, type: !33)
!147 = !DILocation(line: 84, column: 18, scope: !142)
!148 = !DILocation(line: 85, column: 13, scope: !142)
!149 = !DILocation(line: 86, column: 13, scope: !142)
!150 = !DILocation(line: 86, column: 25, scope: !142)
!151 = !DILocation(line: 87, column: 30, scope: !142)
!152 = !DILocation(line: 87, column: 23, scope: !142)
!153 = !DILocation(line: 87, column: 21, scope: !142)
!154 = !DILocation(line: 90, column: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !142, file: !12, line: 90, column: 13)
!156 = !DILocation(line: 90, column: 18, scope: !155)
!157 = !DILocation(line: 90, column: 25, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !12, line: 90, column: 13)
!159 = !DILocation(line: 90, column: 29, scope: !158)
!160 = !DILocation(line: 90, column: 27, scope: !158)
!161 = !DILocation(line: 90, column: 13, scope: !155)
!162 = !DILocation(line: 92, column: 27, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !12, line: 91, column: 13)
!164 = !DILocation(line: 92, column: 32, scope: !163)
!165 = !DILocation(line: 92, column: 22, scope: !163)
!166 = !DILocation(line: 92, column: 17, scope: !163)
!167 = !DILocation(line: 92, column: 25, scope: !163)
!168 = !DILocation(line: 93, column: 13, scope: !163)
!169 = !DILocation(line: 90, column: 39, scope: !158)
!170 = !DILocation(line: 90, column: 13, scope: !158)
!171 = distinct !{!171, !161, !172, !89}
!172 = !DILocation(line: 93, column: 13, scope: !155)
!173 = !DILocation(line: 94, column: 13, scope: !142)
!174 = !DILocation(line: 94, column: 25, scope: !142)
!175 = !DILocation(line: 95, column: 23, scope: !142)
!176 = !DILocation(line: 95, column: 13, scope: !142)
!177 = !DILocation(line: 98, column: 1, scope: !117)
