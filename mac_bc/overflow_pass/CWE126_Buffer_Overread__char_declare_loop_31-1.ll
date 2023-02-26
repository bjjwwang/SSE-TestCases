; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data4 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !33
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx2, align 1, !dbg !35
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i8* %arraydecay3, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !38, metadata !DIExpression()), !dbg !40
  %0 = load i8*, i8** %data, align 8, !dbg !41
  store i8* %0, i8** %dataCopy, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !42, metadata !DIExpression()), !dbg !43
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !44
  store i8* %1, i8** %data4, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !56
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx6, align 1, !dbg !59
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !61
  store i64 %call, i64* %destLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !66
  %3 = load i64, i64* %destLen, align 8, !dbg !68
  %cmp = icmp ult i64 %2, %3, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data4, align 8, !dbg !71
  %5 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx8 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !71
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !71
  %7 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !75
  store i8 %6, i8* %arrayidx9, align 1, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %8, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx10, align 1, !dbg !84
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !85
  call void @printLine(i8* noundef %arraydecay11), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_31_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__char_declare_loop_31_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__char_declare_loop_31_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data4 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !117
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !120
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx2, align 1, !dbg !122
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  store i8* %arraydecay3, i8** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !125, metadata !DIExpression()), !dbg !127
  %0 = load i8*, i8** %data, align 8, !dbg !128
  store i8* %0, i8** %dataCopy, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !129, metadata !DIExpression()), !dbg !130
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !131
  store i8* %1, i8** %data4, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !139
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx6, align 1, !dbg !141
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !143
  store i64 %call, i64* %destLen, align 8, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !148
  %3 = load i64, i64* %destLen, align 8, !dbg !150
  %cmp = icmp ult i64 %2, %3, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data4, align 8, !dbg !153
  %5 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx8 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !153
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !153
  %7 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !157
  store i8 %6, i8* %arrayidx9, align 1, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %8, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !164
  store i8 0, i8* %arrayidx10, align 1, !dbg !165
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !166
  call void @printLine(i8* noundef %arraydecay11), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 10, scope: !11)
!30 = !DILocation(line: 28, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 5, scope: !11)
!32 = !DILocation(line: 29, column: 25, scope: !11)
!33 = !DILocation(line: 30, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 5, scope: !11)
!35 = !DILocation(line: 31, column: 27, scope: !11)
!36 = !DILocation(line: 33, column: 12, scope: !11)
!37 = !DILocation(line: 33, column: 10, scope: !11)
!38 = !DILocalVariable(name: "dataCopy", scope: !39, file: !12, line: 35, type: !17)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!40 = !DILocation(line: 35, column: 16, scope: !39)
!41 = !DILocation(line: 35, column: 27, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !12, line: 36, type: !17)
!43 = !DILocation(line: 36, column: 16, scope: !39)
!44 = !DILocation(line: 36, column: 23, scope: !39)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 38, type: !47)
!46 = distinct !DILexicalBlock(scope: !39, file: !12, line: 37, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !50, line: 94, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!51 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 38, column: 20, scope: !46)
!53 = !DILocalVariable(name: "destLen", scope: !46, file: !12, line: 38, type: !47)
!54 = !DILocation(line: 38, column: 23, scope: !46)
!55 = !DILocalVariable(name: "dest", scope: !46, file: !12, line: 39, type: !26)
!56 = !DILocation(line: 39, column: 18, scope: !46)
!57 = !DILocation(line: 40, column: 13, scope: !46)
!58 = !DILocation(line: 41, column: 13, scope: !46)
!59 = !DILocation(line: 41, column: 25, scope: !46)
!60 = !DILocation(line: 42, column: 30, scope: !46)
!61 = !DILocation(line: 42, column: 23, scope: !46)
!62 = !DILocation(line: 42, column: 21, scope: !46)
!63 = !DILocation(line: 45, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !46, file: !12, line: 45, column: 13)
!65 = !DILocation(line: 45, column: 18, scope: !64)
!66 = !DILocation(line: 45, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !12, line: 45, column: 13)
!68 = !DILocation(line: 45, column: 29, scope: !67)
!69 = !DILocation(line: 45, column: 27, scope: !67)
!70 = !DILocation(line: 45, column: 13, scope: !64)
!71 = !DILocation(line: 47, column: 27, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !12, line: 46, column: 13)
!73 = !DILocation(line: 47, column: 32, scope: !72)
!74 = !DILocation(line: 47, column: 22, scope: !72)
!75 = !DILocation(line: 47, column: 17, scope: !72)
!76 = !DILocation(line: 47, column: 25, scope: !72)
!77 = !DILocation(line: 48, column: 13, scope: !72)
!78 = !DILocation(line: 45, column: 39, scope: !67)
!79 = !DILocation(line: 45, column: 13, scope: !67)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 48, column: 13, scope: !64)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 49, column: 13, scope: !46)
!84 = !DILocation(line: 49, column: 25, scope: !46)
!85 = !DILocation(line: 50, column: 23, scope: !46)
!86 = !DILocation(line: 50, column: 13, scope: !46)
!87 = !DILocation(line: 53, column: 1, scope: !11)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_31_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!89 = !DILocation(line: 94, column: 5, scope: !88)
!90 = !DILocation(line: 95, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !92, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !94, !95}
!94 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !12, line: 106, type: !94)
!97 = !DILocation(line: 106, column: 14, scope: !91)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !12, line: 106, type: !95)
!99 = !DILocation(line: 106, column: 27, scope: !91)
!100 = !DILocation(line: 109, column: 22, scope: !91)
!101 = !DILocation(line: 109, column: 12, scope: !91)
!102 = !DILocation(line: 109, column: 5, scope: !91)
!103 = !DILocation(line: 111, column: 5, scope: !91)
!104 = !DILocation(line: 112, column: 5, scope: !91)
!105 = !DILocation(line: 113, column: 5, scope: !91)
!106 = !DILocation(line: 116, column: 5, scope: !91)
!107 = !DILocation(line: 117, column: 5, scope: !91)
!108 = !DILocation(line: 118, column: 5, scope: !91)
!109 = !DILocation(line: 120, column: 5, scope: !91)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 62, type: !17)
!112 = !DILocation(line: 62, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !12, line: 63, type: !21)
!114 = !DILocation(line: 63, column: 10, scope: !110)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !12, line: 64, type: !26)
!116 = !DILocation(line: 64, column: 10, scope: !110)
!117 = !DILocation(line: 65, column: 5, scope: !110)
!118 = !DILocation(line: 66, column: 5, scope: !110)
!119 = !DILocation(line: 66, column: 25, scope: !110)
!120 = !DILocation(line: 67, column: 5, scope: !110)
!121 = !DILocation(line: 68, column: 5, scope: !110)
!122 = !DILocation(line: 68, column: 27, scope: !110)
!123 = !DILocation(line: 70, column: 12, scope: !110)
!124 = !DILocation(line: 70, column: 10, scope: !110)
!125 = !DILocalVariable(name: "dataCopy", scope: !126, file: !12, line: 72, type: !17)
!126 = distinct !DILexicalBlock(scope: !110, file: !12, line: 71, column: 5)
!127 = !DILocation(line: 72, column: 16, scope: !126)
!128 = !DILocation(line: 72, column: 27, scope: !126)
!129 = !DILocalVariable(name: "data", scope: !126, file: !12, line: 73, type: !17)
!130 = !DILocation(line: 73, column: 16, scope: !126)
!131 = !DILocation(line: 73, column: 23, scope: !126)
!132 = !DILocalVariable(name: "i", scope: !133, file: !12, line: 75, type: !47)
!133 = distinct !DILexicalBlock(scope: !126, file: !12, line: 74, column: 9)
!134 = !DILocation(line: 75, column: 20, scope: !133)
!135 = !DILocalVariable(name: "destLen", scope: !133, file: !12, line: 75, type: !47)
!136 = !DILocation(line: 75, column: 23, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !133, file: !12, line: 76, type: !26)
!138 = !DILocation(line: 76, column: 18, scope: !133)
!139 = !DILocation(line: 77, column: 13, scope: !133)
!140 = !DILocation(line: 78, column: 13, scope: !133)
!141 = !DILocation(line: 78, column: 25, scope: !133)
!142 = !DILocation(line: 79, column: 30, scope: !133)
!143 = !DILocation(line: 79, column: 23, scope: !133)
!144 = !DILocation(line: 79, column: 21, scope: !133)
!145 = !DILocation(line: 82, column: 20, scope: !146)
!146 = distinct !DILexicalBlock(scope: !133, file: !12, line: 82, column: 13)
!147 = !DILocation(line: 82, column: 18, scope: !146)
!148 = !DILocation(line: 82, column: 25, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 82, column: 13)
!150 = !DILocation(line: 82, column: 29, scope: !149)
!151 = !DILocation(line: 82, column: 27, scope: !149)
!152 = !DILocation(line: 82, column: 13, scope: !146)
!153 = !DILocation(line: 84, column: 27, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !12, line: 83, column: 13)
!155 = !DILocation(line: 84, column: 32, scope: !154)
!156 = !DILocation(line: 84, column: 22, scope: !154)
!157 = !DILocation(line: 84, column: 17, scope: !154)
!158 = !DILocation(line: 84, column: 25, scope: !154)
!159 = !DILocation(line: 85, column: 13, scope: !154)
!160 = !DILocation(line: 82, column: 39, scope: !149)
!161 = !DILocation(line: 82, column: 13, scope: !149)
!162 = distinct !{!162, !152, !163, !82}
!163 = !DILocation(line: 85, column: 13, scope: !146)
!164 = !DILocation(line: 86, column: 13, scope: !133)
!165 = !DILocation(line: 86, column: 25, scope: !133)
!166 = !DILocation(line: 87, column: 23, scope: !133)
!167 = !DILocation(line: 87, column: 13, scope: !133)
!168 = !DILocation(line: 90, column: 1, scope: !110)
