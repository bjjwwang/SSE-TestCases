; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx2, align 1, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %1, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !58
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !58
  %4 = load i8*, i8** %data, align 8, !dbg !59
  %5 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !59
  store i8 %3, i8* %arrayidx4, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %6, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !68
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !68
  store i8 0, i8* %arrayidx5, align 1, !dbg !69
  %8 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* noundef %8), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* noundef null), !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 noundef %conv), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03_good(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03_bad(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  store i8* %arraydecay, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !114
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx2, align 1, !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !120
  %cmp = icmp ult i64 %1, 100, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !126
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !127
  %5 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !127
  store i8 %3, i8* %arrayidx4, align 1, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %6, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !135
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !135
  store i8 0, i8* %arrayidx5, align 1, !dbg !136
  %8 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* noundef %8), !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !140 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !147
  store i8* %arraydecay, i8** %data, align 8, !dbg !150
  %0 = load i8*, i8** %data, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !156, metadata !DIExpression()), !dbg !157
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !158
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !159
  store i8 0, i8* %arrayidx2, align 1, !dbg !160
  store i64 0, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !164
  %cmp = icmp ult i64 %1, 100, !dbg !166
  br i1 %cmp, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !170
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !170
  %4 = load i8*, i8** %data, align 8, !dbg !171
  %5 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !171
  store i8 %3, i8* %arrayidx4, align 1, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !175
  %inc = add i64 %6, 1, !dbg !175
  store i64 %inc, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !179
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !179
  store i8 0, i8* %arrayidx5, align 1, !dbg !180
  %8 = load i8*, i8** %data, align 8, !dbg !181
  call void @printLine(i8* noundef %8), !dbg !182
  ret void, !dbg !183
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 9, scope: !31)
!35 = !DILocation(line: 33, column: 17, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 31, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !41, line: 94, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 36, column: 16, scope: !37)
!44 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 37, type: !26)
!45 = !DILocation(line: 37, column: 14, scope: !37)
!46 = !DILocation(line: 38, column: 9, scope: !37)
!47 = !DILocation(line: 39, column: 9, scope: !37)
!48 = !DILocation(line: 39, column: 23, scope: !37)
!49 = !DILocation(line: 41, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !37, file: !12, line: 41, column: 9)
!51 = !DILocation(line: 41, column: 14, scope: !50)
!52 = !DILocation(line: 41, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 41, column: 9)
!54 = !DILocation(line: 41, column: 23, scope: !53)
!55 = !DILocation(line: 41, column: 9, scope: !50)
!56 = !DILocation(line: 43, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 42, column: 9)
!58 = !DILocation(line: 43, column: 23, scope: !57)
!59 = !DILocation(line: 43, column: 13, scope: !57)
!60 = !DILocation(line: 43, column: 18, scope: !57)
!61 = !DILocation(line: 43, column: 21, scope: !57)
!62 = !DILocation(line: 44, column: 9, scope: !57)
!63 = !DILocation(line: 41, column: 31, scope: !53)
!64 = !DILocation(line: 41, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 44, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 45, column: 9, scope: !37)
!69 = !DILocation(line: 45, column: 21, scope: !37)
!70 = !DILocation(line: 46, column: 19, scope: !37)
!71 = !DILocation(line: 46, column: 9, scope: !37)
!72 = !DILocation(line: 48, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_03_good", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DILocation(line: 115, column: 5, scope: !73)
!75 = !DILocation(line: 116, column: 5, scope: !73)
!76 = !DILocation(line: 117, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !78, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 129, type: !80)
!83 = !DILocation(line: 129, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 129, type: !81)
!85 = !DILocation(line: 129, column: 27, scope: !77)
!86 = !DILocation(line: 132, column: 22, scope: !77)
!87 = !DILocation(line: 132, column: 12, scope: !77)
!88 = !DILocation(line: 132, column: 5, scope: !77)
!89 = !DILocation(line: 134, column: 5, scope: !77)
!90 = !DILocation(line: 135, column: 5, scope: !77)
!91 = !DILocation(line: 136, column: 5, scope: !77)
!92 = !DILocation(line: 139, column: 5, scope: !77)
!93 = !DILocation(line: 140, column: 5, scope: !77)
!94 = !DILocation(line: 141, column: 5, scope: !77)
!95 = !DILocation(line: 143, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 57, type: !17)
!98 = !DILocation(line: 57, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 58, type: !21)
!100 = !DILocation(line: 58, column: 10, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 59, type: !26)
!102 = !DILocation(line: 59, column: 10, scope: !96)
!103 = !DILocation(line: 68, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !12, line: 66, column: 5)
!105 = distinct !DILexicalBlock(scope: !96, file: !12, line: 60, column: 8)
!106 = !DILocation(line: 68, column: 14, scope: !104)
!107 = !DILocation(line: 69, column: 9, scope: !104)
!108 = !DILocation(line: 69, column: 17, scope: !104)
!109 = !DILocalVariable(name: "i", scope: !110, file: !12, line: 72, type: !38)
!110 = distinct !DILexicalBlock(scope: !96, file: !12, line: 71, column: 5)
!111 = !DILocation(line: 72, column: 16, scope: !110)
!112 = !DILocalVariable(name: "source", scope: !110, file: !12, line: 73, type: !26)
!113 = !DILocation(line: 73, column: 14, scope: !110)
!114 = !DILocation(line: 74, column: 9, scope: !110)
!115 = !DILocation(line: 75, column: 9, scope: !110)
!116 = !DILocation(line: 75, column: 23, scope: !110)
!117 = !DILocation(line: 77, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !12, line: 77, column: 9)
!119 = !DILocation(line: 77, column: 14, scope: !118)
!120 = !DILocation(line: 77, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 77, column: 9)
!122 = !DILocation(line: 77, column: 23, scope: !121)
!123 = !DILocation(line: 77, column: 9, scope: !118)
!124 = !DILocation(line: 79, column: 30, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 78, column: 9)
!126 = !DILocation(line: 79, column: 23, scope: !125)
!127 = !DILocation(line: 79, column: 13, scope: !125)
!128 = !DILocation(line: 79, column: 18, scope: !125)
!129 = !DILocation(line: 79, column: 21, scope: !125)
!130 = !DILocation(line: 80, column: 9, scope: !125)
!131 = !DILocation(line: 77, column: 31, scope: !121)
!132 = !DILocation(line: 77, column: 9, scope: !121)
!133 = distinct !{!133, !123, !134, !67}
!134 = !DILocation(line: 80, column: 9, scope: !118)
!135 = !DILocation(line: 81, column: 9, scope: !110)
!136 = !DILocation(line: 81, column: 21, scope: !110)
!137 = !DILocation(line: 82, column: 19, scope: !110)
!138 = !DILocation(line: 82, column: 9, scope: !110)
!139 = !DILocation(line: 84, column: 1, scope: !96)
!140 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!141 = !DILocalVariable(name: "data", scope: !140, file: !12, line: 89, type: !17)
!142 = !DILocation(line: 89, column: 12, scope: !140)
!143 = !DILocalVariable(name: "dataBadBuffer", scope: !140, file: !12, line: 90, type: !21)
!144 = !DILocation(line: 90, column: 10, scope: !140)
!145 = !DILocalVariable(name: "dataGoodBuffer", scope: !140, file: !12, line: 91, type: !26)
!146 = !DILocation(line: 91, column: 10, scope: !140)
!147 = !DILocation(line: 95, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !149, file: !12, line: 93, column: 5)
!149 = distinct !DILexicalBlock(scope: !140, file: !12, line: 92, column: 8)
!150 = !DILocation(line: 95, column: 14, scope: !148)
!151 = !DILocation(line: 96, column: 9, scope: !148)
!152 = !DILocation(line: 96, column: 17, scope: !148)
!153 = !DILocalVariable(name: "i", scope: !154, file: !12, line: 99, type: !38)
!154 = distinct !DILexicalBlock(scope: !140, file: !12, line: 98, column: 5)
!155 = !DILocation(line: 99, column: 16, scope: !154)
!156 = !DILocalVariable(name: "source", scope: !154, file: !12, line: 100, type: !26)
!157 = !DILocation(line: 100, column: 14, scope: !154)
!158 = !DILocation(line: 101, column: 9, scope: !154)
!159 = !DILocation(line: 102, column: 9, scope: !154)
!160 = !DILocation(line: 102, column: 23, scope: !154)
!161 = !DILocation(line: 104, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !154, file: !12, line: 104, column: 9)
!163 = !DILocation(line: 104, column: 14, scope: !162)
!164 = !DILocation(line: 104, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !12, line: 104, column: 9)
!166 = !DILocation(line: 104, column: 23, scope: !165)
!167 = !DILocation(line: 104, column: 9, scope: !162)
!168 = !DILocation(line: 106, column: 30, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !12, line: 105, column: 9)
!170 = !DILocation(line: 106, column: 23, scope: !169)
!171 = !DILocation(line: 106, column: 13, scope: !169)
!172 = !DILocation(line: 106, column: 18, scope: !169)
!173 = !DILocation(line: 106, column: 21, scope: !169)
!174 = !DILocation(line: 107, column: 9, scope: !169)
!175 = !DILocation(line: 104, column: 31, scope: !165)
!176 = !DILocation(line: 104, column: 9, scope: !165)
!177 = distinct !{!177, !167, !178, !67}
!178 = !DILocation(line: 107, column: 9, scope: !162)
!179 = !DILocation(line: 108, column: 9, scope: !154)
!180 = !DILocation(line: 108, column: 21, scope: !154)
!181 = !DILocation(line: 109, column: 19, scope: !154)
!182 = !DILocation(line: 109, column: 9, scope: !154)
!183 = !DILocation(line: 111, column: 1, scope: !140)
