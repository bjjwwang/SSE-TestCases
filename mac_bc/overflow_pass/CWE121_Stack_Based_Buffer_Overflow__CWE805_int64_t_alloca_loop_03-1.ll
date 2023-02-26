; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03_bad() #0 !dbg !15 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 400, align 16, !dbg !24
  %1 = bitcast i8* %0 to i64*, !dbg !25
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = alloca i8, i64 800, align 16, !dbg !28
  %3 = bitcast i8* %2 to i64*, !dbg !29
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !27
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !30
  store i64* %4, i64** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %6, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !57
  %8 = load i64, i64* %arrayidx, align 8, !dbg !57
  %9 = load i64*, i64** %data, align 8, !dbg !58
  %10 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !58
  store i64 %8, i64* %arrayidx1, align 8, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %11, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !67
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !67
  call void @printLongLongLine(i64 noundef %13), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* noundef null), !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 noundef %conv), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 400, align 16, !dbg !100
  %1 = bitcast i8* %0 to i64*, !dbg !101
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %2 = alloca i8, i64 800, align 16, !dbg !104
  %3 = bitcast i8* %2 to i64*, !dbg !105
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !103
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !106
  store i64* %4, i64** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !119
  %cmp = icmp ult i64 %6, 100, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !125
  %8 = load i64, i64* %arrayidx, align 8, !dbg !125
  %9 = load i64*, i64** %data, align 8, !dbg !126
  %10 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !126
  store i64 %8, i64* %arrayidx1, align 8, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %11, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !134
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !134
  call void @printLongLongLine(i64 noundef %13), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !137 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  %0 = alloca i8, i64 400, align 16, !dbg !142
  %1 = bitcast i8* %0 to i64*, !dbg !143
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %2 = alloca i8, i64 800, align 16, !dbg !146
  %3 = bitcast i8* %2 to i64*, !dbg !147
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !145
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !148
  store i64* %4, i64** %data, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !152, metadata !DIExpression()), !dbg !154
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %i, metadata !155, metadata !DIExpression()), !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !161
  %cmp = icmp ult i64 %6, 100, !dbg !163
  br i1 %cmp, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !167
  %8 = load i64, i64* %arrayidx, align 8, !dbg !167
  %9 = load i64*, i64** %data, align 8, !dbg !168
  %10 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !168
  store i64 %8, i64* %arrayidx1, align 8, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %11, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !176
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !176
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !176
  call void @printLongLongLine(i64 noundef %13), !dbg !177
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"Homebrew clang version 14.0.6"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 23, type: !3)
!21 = !DILocation(line: 23, column: 15, scope: !15)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 24, type: !3)
!23 = !DILocation(line: 24, column: 15, scope: !15)
!24 = !DILocation(line: 24, column: 42, scope: !15)
!25 = !DILocation(line: 24, column: 31, scope: !15)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 25, type: !3)
!27 = !DILocation(line: 25, column: 15, scope: !15)
!28 = !DILocation(line: 25, column: 43, scope: !15)
!29 = !DILocation(line: 25, column: 32, scope: !15)
!30 = !DILocation(line: 30, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !16, line: 27, column: 5)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 26, column: 8)
!33 = !DILocation(line: 30, column: 14, scope: !31)
!34 = !DILocalVariable(name: "source", scope: !35, file: !16, line: 33, type: !36)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 33, column: 17, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !41, file: !16, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !35, file: !16, line: 34, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 31, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !45, line: 94, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 35, column: 20, scope: !41)
!48 = !DILocation(line: 37, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !16, line: 37, column: 13)
!50 = !DILocation(line: 37, column: 18, scope: !49)
!51 = !DILocation(line: 37, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !16, line: 37, column: 13)
!53 = !DILocation(line: 37, column: 27, scope: !52)
!54 = !DILocation(line: 37, column: 13, scope: !49)
!55 = !DILocation(line: 39, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !16, line: 38, column: 13)
!57 = !DILocation(line: 39, column: 27, scope: !56)
!58 = !DILocation(line: 39, column: 17, scope: !56)
!59 = !DILocation(line: 39, column: 22, scope: !56)
!60 = !DILocation(line: 39, column: 25, scope: !56)
!61 = !DILocation(line: 40, column: 13, scope: !56)
!62 = !DILocation(line: 37, column: 35, scope: !52)
!63 = !DILocation(line: 37, column: 13, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 40, column: 13, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 41, column: 31, scope: !41)
!68 = !DILocation(line: 41, column: 13, scope: !41)
!69 = !DILocation(line: 44, column: 1, scope: !15)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_03_good", scope: !16, file: !16, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!71 = !DILocation(line: 107, column: 5, scope: !70)
!72 = !DILocation(line: 108, column: 5, scope: !70)
!73 = !DILocation(line: 109, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 121, type: !75, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !16, line: 121, type: !77)
!82 = !DILocation(line: 121, column: 14, scope: !74)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !16, line: 121, type: !78)
!84 = !DILocation(line: 121, column: 27, scope: !74)
!85 = !DILocation(line: 124, column: 22, scope: !74)
!86 = !DILocation(line: 124, column: 12, scope: !74)
!87 = !DILocation(line: 124, column: 5, scope: !74)
!88 = !DILocation(line: 126, column: 5, scope: !74)
!89 = !DILocation(line: 127, column: 5, scope: !74)
!90 = !DILocation(line: 128, column: 5, scope: !74)
!91 = !DILocation(line: 131, column: 5, scope: !74)
!92 = !DILocation(line: 132, column: 5, scope: !74)
!93 = !DILocation(line: 133, column: 5, scope: !74)
!94 = !DILocation(line: 135, column: 5, scope: !74)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!96 = !DILocalVariable(name: "data", scope: !95, file: !16, line: 53, type: !3)
!97 = !DILocation(line: 53, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !16, line: 54, type: !3)
!99 = !DILocation(line: 54, column: 15, scope: !95)
!100 = !DILocation(line: 54, column: 42, scope: !95)
!101 = !DILocation(line: 54, column: 31, scope: !95)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !16, line: 55, type: !3)
!103 = !DILocation(line: 55, column: 15, scope: !95)
!104 = !DILocation(line: 55, column: 43, scope: !95)
!105 = !DILocation(line: 55, column: 32, scope: !95)
!106 = !DILocation(line: 64, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !108, file: !16, line: 62, column: 5)
!108 = distinct !DILexicalBlock(scope: !95, file: !16, line: 56, column: 8)
!109 = !DILocation(line: 64, column: 14, scope: !107)
!110 = !DILocalVariable(name: "source", scope: !111, file: !16, line: 67, type: !36)
!111 = distinct !DILexicalBlock(scope: !95, file: !16, line: 66, column: 5)
!112 = !DILocation(line: 67, column: 17, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !114, file: !16, line: 69, type: !42)
!114 = distinct !DILexicalBlock(scope: !111, file: !16, line: 68, column: 9)
!115 = !DILocation(line: 69, column: 20, scope: !114)
!116 = !DILocation(line: 71, column: 20, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !16, line: 71, column: 13)
!118 = !DILocation(line: 71, column: 18, scope: !117)
!119 = !DILocation(line: 71, column: 25, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !16, line: 71, column: 13)
!121 = !DILocation(line: 71, column: 27, scope: !120)
!122 = !DILocation(line: 71, column: 13, scope: !117)
!123 = !DILocation(line: 73, column: 34, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !16, line: 72, column: 13)
!125 = !DILocation(line: 73, column: 27, scope: !124)
!126 = !DILocation(line: 73, column: 17, scope: !124)
!127 = !DILocation(line: 73, column: 22, scope: !124)
!128 = !DILocation(line: 73, column: 25, scope: !124)
!129 = !DILocation(line: 74, column: 13, scope: !124)
!130 = !DILocation(line: 71, column: 35, scope: !120)
!131 = !DILocation(line: 71, column: 13, scope: !120)
!132 = distinct !{!132, !122, !133, !66}
!133 = !DILocation(line: 74, column: 13, scope: !117)
!134 = !DILocation(line: 75, column: 31, scope: !114)
!135 = !DILocation(line: 75, column: 13, scope: !114)
!136 = !DILocation(line: 78, column: 1, scope: !95)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!138 = !DILocalVariable(name: "data", scope: !137, file: !16, line: 83, type: !3)
!139 = !DILocation(line: 83, column: 15, scope: !137)
!140 = !DILocalVariable(name: "dataBadBuffer", scope: !137, file: !16, line: 84, type: !3)
!141 = !DILocation(line: 84, column: 15, scope: !137)
!142 = !DILocation(line: 84, column: 42, scope: !137)
!143 = !DILocation(line: 84, column: 31, scope: !137)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !137, file: !16, line: 85, type: !3)
!145 = !DILocation(line: 85, column: 15, scope: !137)
!146 = !DILocation(line: 85, column: 43, scope: !137)
!147 = !DILocation(line: 85, column: 32, scope: !137)
!148 = !DILocation(line: 89, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !16, line: 87, column: 5)
!150 = distinct !DILexicalBlock(scope: !137, file: !16, line: 86, column: 8)
!151 = !DILocation(line: 89, column: 14, scope: !149)
!152 = !DILocalVariable(name: "source", scope: !153, file: !16, line: 92, type: !36)
!153 = distinct !DILexicalBlock(scope: !137, file: !16, line: 91, column: 5)
!154 = !DILocation(line: 92, column: 17, scope: !153)
!155 = !DILocalVariable(name: "i", scope: !156, file: !16, line: 94, type: !42)
!156 = distinct !DILexicalBlock(scope: !153, file: !16, line: 93, column: 9)
!157 = !DILocation(line: 94, column: 20, scope: !156)
!158 = !DILocation(line: 96, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !16, line: 96, column: 13)
!160 = !DILocation(line: 96, column: 18, scope: !159)
!161 = !DILocation(line: 96, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !16, line: 96, column: 13)
!163 = !DILocation(line: 96, column: 27, scope: !162)
!164 = !DILocation(line: 96, column: 13, scope: !159)
!165 = !DILocation(line: 98, column: 34, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !16, line: 97, column: 13)
!167 = !DILocation(line: 98, column: 27, scope: !166)
!168 = !DILocation(line: 98, column: 17, scope: !166)
!169 = !DILocation(line: 98, column: 22, scope: !166)
!170 = !DILocation(line: 98, column: 25, scope: !166)
!171 = !DILocation(line: 99, column: 13, scope: !166)
!172 = !DILocation(line: 96, column: 35, scope: !162)
!173 = !DILocation(line: 96, column: 13, scope: !162)
!174 = distinct !{!174, !164, !175, !66}
!175 = !DILocation(line: 99, column: 13, scope: !159)
!176 = !DILocation(line: 100, column: 31, scope: !156)
!177 = !DILocation(line: 100, column: 13, scope: !156)
!178 = !DILocation(line: 103, column: 1, scope: !137)
