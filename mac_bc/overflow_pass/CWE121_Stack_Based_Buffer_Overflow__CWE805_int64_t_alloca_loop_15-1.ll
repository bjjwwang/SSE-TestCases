; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_bad() #0 !dbg !15 {
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
  store i64* %4, i64** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %6, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !55
  %8 = load i64, i64* %arrayidx, align 8, !dbg !55
  %9 = load i64*, i64** %data, align 8, !dbg !56
  %10 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !56
  store i64 %8, i64* %arrayidx1, align 8, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %11, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !65
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !65
  call void @printLongLongLine(i64 noundef %13), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* noundef null), !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 noundef %conv), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_good(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_bad(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 400, align 16, !dbg !98
  %1 = bitcast i8* %0 to i64*, !dbg !99
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %2 = alloca i8, i64 800, align 16, !dbg !102
  %3 = bitcast i8* %2 to i64*, !dbg !103
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !101
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !104
  store i64* %4, i64** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !115
  %cmp = icmp ult i64 %6, 100, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !121
  %8 = load i64, i64* %arrayidx, align 8, !dbg !121
  %9 = load i64*, i64** %data, align 8, !dbg !122
  %10 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !122
  store i64 %8, i64* %arrayidx1, align 8, !dbg !124
  br label %for.inc, !dbg !125

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !126
  %inc = add i64 %11, 1, !dbg !126
  store i64 %inc, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !127, !llvm.loop !128

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !130
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !130
  call void @printLongLongLine(i64 noundef %13), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  %0 = alloca i8, i64 400, align 16, !dbg !138
  %1 = bitcast i8* %0 to i64*, !dbg !139
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  %2 = alloca i8, i64 800, align 16, !dbg !142
  %3 = bitcast i8* %2 to i64*, !dbg !143
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !141
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !144
  store i64* %4, i64** %data, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !146, metadata !DIExpression()), !dbg !148
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !148
  call void @llvm.dbg.declare(metadata i64* %i, metadata !149, metadata !DIExpression()), !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !155
  %cmp = icmp ult i64 %6, 100, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !161
  %8 = load i64, i64* %arrayidx, align 8, !dbg !161
  %9 = load i64*, i64** %data, align 8, !dbg !162
  %10 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !162
  store i64 %8, i64* %arrayidx1, align 8, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %11, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !170
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !170
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !170
  call void @printLongLongLine(i64 noundef %13), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!30 = !DILocation(line: 31, column: 16, scope: !15)
!31 = !DILocation(line: 31, column: 14, scope: !15)
!32 = !DILocalVariable(name: "source", scope: !33, file: !16, line: 39, type: !34)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 39, column: 17, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !16, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !33, file: !16, line: 40, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 31, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !43, line: 94, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 41, column: 20, scope: !39)
!46 = !DILocation(line: 43, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !39, file: !16, line: 43, column: 13)
!48 = !DILocation(line: 43, column: 18, scope: !47)
!49 = !DILocation(line: 43, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !16, line: 43, column: 13)
!51 = !DILocation(line: 43, column: 27, scope: !50)
!52 = !DILocation(line: 43, column: 13, scope: !47)
!53 = !DILocation(line: 45, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !16, line: 44, column: 13)
!55 = !DILocation(line: 45, column: 27, scope: !54)
!56 = !DILocation(line: 45, column: 17, scope: !54)
!57 = !DILocation(line: 45, column: 22, scope: !54)
!58 = !DILocation(line: 45, column: 25, scope: !54)
!59 = !DILocation(line: 46, column: 13, scope: !54)
!60 = !DILocation(line: 43, column: 35, scope: !50)
!61 = !DILocation(line: 43, column: 13, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 46, column: 13, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 47, column: 31, scope: !39)
!66 = !DILocation(line: 47, column: 13, scope: !39)
!67 = !DILocation(line: 50, column: 1, scope: !15)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_15_good", scope: !16, file: !16, line: 118, type: !17, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!69 = !DILocation(line: 120, column: 5, scope: !68)
!70 = !DILocation(line: 121, column: 5, scope: !68)
!71 = !DILocation(line: 122, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 134, type: !73, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !16, line: 134, type: !75)
!80 = !DILocation(line: 134, column: 14, scope: !72)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !16, line: 134, type: !76)
!82 = !DILocation(line: 134, column: 27, scope: !72)
!83 = !DILocation(line: 137, column: 22, scope: !72)
!84 = !DILocation(line: 137, column: 12, scope: !72)
!85 = !DILocation(line: 137, column: 5, scope: !72)
!86 = !DILocation(line: 139, column: 5, scope: !72)
!87 = !DILocation(line: 140, column: 5, scope: !72)
!88 = !DILocation(line: 141, column: 5, scope: !72)
!89 = !DILocation(line: 144, column: 5, scope: !72)
!90 = !DILocation(line: 145, column: 5, scope: !72)
!91 = !DILocation(line: 146, column: 5, scope: !72)
!92 = !DILocation(line: 148, column: 5, scope: !72)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!94 = !DILocalVariable(name: "data", scope: !93, file: !16, line: 59, type: !3)
!95 = !DILocation(line: 59, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !16, line: 60, type: !3)
!97 = !DILocation(line: 60, column: 15, scope: !93)
!98 = !DILocation(line: 60, column: 42, scope: !93)
!99 = !DILocation(line: 60, column: 31, scope: !93)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !16, line: 61, type: !3)
!101 = !DILocation(line: 61, column: 15, scope: !93)
!102 = !DILocation(line: 61, column: 43, scope: !93)
!103 = !DILocation(line: 61, column: 32, scope: !93)
!104 = !DILocation(line: 70, column: 16, scope: !93)
!105 = !DILocation(line: 70, column: 14, scope: !93)
!106 = !DILocalVariable(name: "source", scope: !107, file: !16, line: 74, type: !34)
!107 = distinct !DILexicalBlock(scope: !93, file: !16, line: 73, column: 5)
!108 = !DILocation(line: 74, column: 17, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !110, file: !16, line: 76, type: !40)
!110 = distinct !DILexicalBlock(scope: !107, file: !16, line: 75, column: 9)
!111 = !DILocation(line: 76, column: 20, scope: !110)
!112 = !DILocation(line: 78, column: 20, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !16, line: 78, column: 13)
!114 = !DILocation(line: 78, column: 18, scope: !113)
!115 = !DILocation(line: 78, column: 25, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !16, line: 78, column: 13)
!117 = !DILocation(line: 78, column: 27, scope: !116)
!118 = !DILocation(line: 78, column: 13, scope: !113)
!119 = !DILocation(line: 80, column: 34, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !16, line: 79, column: 13)
!121 = !DILocation(line: 80, column: 27, scope: !120)
!122 = !DILocation(line: 80, column: 17, scope: !120)
!123 = !DILocation(line: 80, column: 22, scope: !120)
!124 = !DILocation(line: 80, column: 25, scope: !120)
!125 = !DILocation(line: 81, column: 13, scope: !120)
!126 = !DILocation(line: 78, column: 35, scope: !116)
!127 = !DILocation(line: 78, column: 13, scope: !116)
!128 = distinct !{!128, !118, !129, !64}
!129 = !DILocation(line: 81, column: 13, scope: !113)
!130 = !DILocation(line: 82, column: 31, scope: !110)
!131 = !DILocation(line: 82, column: 13, scope: !110)
!132 = !DILocation(line: 85, column: 1, scope: !93)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 88, type: !17, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!134 = !DILocalVariable(name: "data", scope: !133, file: !16, line: 90, type: !3)
!135 = !DILocation(line: 90, column: 15, scope: !133)
!136 = !DILocalVariable(name: "dataBadBuffer", scope: !133, file: !16, line: 91, type: !3)
!137 = !DILocation(line: 91, column: 15, scope: !133)
!138 = !DILocation(line: 91, column: 42, scope: !133)
!139 = !DILocation(line: 91, column: 31, scope: !133)
!140 = !DILocalVariable(name: "dataGoodBuffer", scope: !133, file: !16, line: 92, type: !3)
!141 = !DILocation(line: 92, column: 15, scope: !133)
!142 = !DILocation(line: 92, column: 43, scope: !133)
!143 = !DILocation(line: 92, column: 32, scope: !133)
!144 = !DILocation(line: 97, column: 16, scope: !133)
!145 = !DILocation(line: 97, column: 14, scope: !133)
!146 = !DILocalVariable(name: "source", scope: !147, file: !16, line: 105, type: !34)
!147 = distinct !DILexicalBlock(scope: !133, file: !16, line: 104, column: 5)
!148 = !DILocation(line: 105, column: 17, scope: !147)
!149 = !DILocalVariable(name: "i", scope: !150, file: !16, line: 107, type: !40)
!150 = distinct !DILexicalBlock(scope: !147, file: !16, line: 106, column: 9)
!151 = !DILocation(line: 107, column: 20, scope: !150)
!152 = !DILocation(line: 109, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !16, line: 109, column: 13)
!154 = !DILocation(line: 109, column: 18, scope: !153)
!155 = !DILocation(line: 109, column: 25, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !16, line: 109, column: 13)
!157 = !DILocation(line: 109, column: 27, scope: !156)
!158 = !DILocation(line: 109, column: 13, scope: !153)
!159 = !DILocation(line: 111, column: 34, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !16, line: 110, column: 13)
!161 = !DILocation(line: 111, column: 27, scope: !160)
!162 = !DILocation(line: 111, column: 17, scope: !160)
!163 = !DILocation(line: 111, column: 22, scope: !160)
!164 = !DILocation(line: 111, column: 25, scope: !160)
!165 = !DILocation(line: 112, column: 13, scope: !160)
!166 = !DILocation(line: 109, column: 35, scope: !156)
!167 = !DILocation(line: 109, column: 13, scope: !156)
!168 = distinct !{!168, !158, !169, !64}
!169 = !DILocation(line: 112, column: 13, scope: !153)
!170 = !DILocation(line: 113, column: 31, scope: !150)
!171 = !DILocation(line: 113, column: 13, scope: !150)
!172 = !DILocation(line: 116, column: 1, scope: !133)
