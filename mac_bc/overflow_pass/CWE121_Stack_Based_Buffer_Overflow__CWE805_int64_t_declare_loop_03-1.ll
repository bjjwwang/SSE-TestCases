; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i64* %arraydecay, i64** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !56
  %3 = load i64, i64* %arrayidx, align 8, !dbg !56
  %4 = load i64*, i64** %data, align 8, !dbg !57
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !57
  store i64 %3, i64* %arrayidx1, align 8, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !66
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !66
  call void @printLongLongLine(i64 noundef %8), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* noundef null), !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 noundef %conv), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03_good(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03_bad(), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i64* %arraydecay, i64** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !110
  store i64 0, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !113

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !114
  %cmp = icmp ult i64 %1, 100, !dbg !116
  br i1 %cmp, label %for.body, label %for.end, !dbg !117

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !120
  %3 = load i64, i64* %arrayidx, align 8, !dbg !120
  %4 = load i64*, i64** %data, align 8, !dbg !121
  %5 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !121
  store i64 %3, i64* %arrayidx1, align 8, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !125
  %inc = add i64 %6, 1, !dbg !125
  store i64 %inc, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !129
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !129
  call void @printLongLongLine(i64 noundef %8), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !132 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !139
  store i64* %arraydecay, i64** %data, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !152
  %cmp = icmp ult i64 %1, 100, !dbg !154
  br i1 %cmp, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !158
  %3 = load i64, i64* %arrayidx, align 8, !dbg !158
  %4 = load i64*, i64** %data, align 8, !dbg !159
  %5 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !159
  store i64 %3, i64* %arrayidx1, align 8, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %6, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !167
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !167
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !167
  call void @printLongLongLine(i64 noundef %8), !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 23, column: 15, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 24, column: 13, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 25, column: 13, scope: !11)
!32 = !DILocation(line: 30, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !12, line: 27, column: 5)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!35 = !DILocation(line: 30, column: 14, scope: !33)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 33, type: !28)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!38 = !DILocation(line: 33, column: 17, scope: !37)
!39 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 34, column: 9)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 31, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !44, line: 94, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 35, column: 20, scope: !40)
!47 = !DILocation(line: 37, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !12, line: 37, column: 13)
!49 = !DILocation(line: 37, column: 18, scope: !48)
!50 = !DILocation(line: 37, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 37, column: 13)
!52 = !DILocation(line: 37, column: 27, scope: !51)
!53 = !DILocation(line: 37, column: 13, scope: !48)
!54 = !DILocation(line: 39, column: 34, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 38, column: 13)
!56 = !DILocation(line: 39, column: 27, scope: !55)
!57 = !DILocation(line: 39, column: 17, scope: !55)
!58 = !DILocation(line: 39, column: 22, scope: !55)
!59 = !DILocation(line: 39, column: 25, scope: !55)
!60 = !DILocation(line: 40, column: 13, scope: !55)
!61 = !DILocation(line: 37, column: 35, scope: !51)
!62 = !DILocation(line: 37, column: 13, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 40, column: 13, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 41, column: 31, scope: !40)
!67 = !DILocation(line: 41, column: 13, scope: !40)
!68 = !DILocation(line: 44, column: 1, scope: !11)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_03_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!70 = !DILocation(line: 107, column: 5, scope: !69)
!71 = !DILocation(line: 108, column: 5, scope: !69)
!72 = !DILocation(line: 109, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !74, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 121, type: !76)
!81 = !DILocation(line: 121, column: 14, scope: !73)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 121, type: !77)
!83 = !DILocation(line: 121, column: 27, scope: !73)
!84 = !DILocation(line: 124, column: 22, scope: !73)
!85 = !DILocation(line: 124, column: 12, scope: !73)
!86 = !DILocation(line: 124, column: 5, scope: !73)
!87 = !DILocation(line: 126, column: 5, scope: !73)
!88 = !DILocation(line: 127, column: 5, scope: !73)
!89 = !DILocation(line: 128, column: 5, scope: !73)
!90 = !DILocation(line: 131, column: 5, scope: !73)
!91 = !DILocation(line: 132, column: 5, scope: !73)
!92 = !DILocation(line: 133, column: 5, scope: !73)
!93 = !DILocation(line: 135, column: 5, scope: !73)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 53, type: !17)
!96 = !DILocation(line: 53, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !12, line: 54, type: !23)
!98 = !DILocation(line: 54, column: 13, scope: !94)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !12, line: 55, type: !28)
!100 = !DILocation(line: 55, column: 13, scope: !94)
!101 = !DILocation(line: 64, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !12, line: 62, column: 5)
!103 = distinct !DILexicalBlock(scope: !94, file: !12, line: 56, column: 8)
!104 = !DILocation(line: 64, column: 14, scope: !102)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 67, type: !28)
!106 = distinct !DILexicalBlock(scope: !94, file: !12, line: 66, column: 5)
!107 = !DILocation(line: 67, column: 17, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !109, file: !12, line: 69, type: !41)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 68, column: 9)
!110 = !DILocation(line: 69, column: 20, scope: !109)
!111 = !DILocation(line: 71, column: 20, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 71, column: 13)
!113 = !DILocation(line: 71, column: 18, scope: !112)
!114 = !DILocation(line: 71, column: 25, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 71, column: 13)
!116 = !DILocation(line: 71, column: 27, scope: !115)
!117 = !DILocation(line: 71, column: 13, scope: !112)
!118 = !DILocation(line: 73, column: 34, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 72, column: 13)
!120 = !DILocation(line: 73, column: 27, scope: !119)
!121 = !DILocation(line: 73, column: 17, scope: !119)
!122 = !DILocation(line: 73, column: 22, scope: !119)
!123 = !DILocation(line: 73, column: 25, scope: !119)
!124 = !DILocation(line: 74, column: 13, scope: !119)
!125 = !DILocation(line: 71, column: 35, scope: !115)
!126 = !DILocation(line: 71, column: 13, scope: !115)
!127 = distinct !{!127, !117, !128, !65}
!128 = !DILocation(line: 74, column: 13, scope: !112)
!129 = !DILocation(line: 75, column: 31, scope: !109)
!130 = !DILocation(line: 75, column: 13, scope: !109)
!131 = !DILocation(line: 78, column: 1, scope: !94)
!132 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!133 = !DILocalVariable(name: "data", scope: !132, file: !12, line: 83, type: !17)
!134 = !DILocation(line: 83, column: 15, scope: !132)
!135 = !DILocalVariable(name: "dataBadBuffer", scope: !132, file: !12, line: 84, type: !23)
!136 = !DILocation(line: 84, column: 13, scope: !132)
!137 = !DILocalVariable(name: "dataGoodBuffer", scope: !132, file: !12, line: 85, type: !28)
!138 = !DILocation(line: 85, column: 13, scope: !132)
!139 = !DILocation(line: 89, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !141, file: !12, line: 87, column: 5)
!141 = distinct !DILexicalBlock(scope: !132, file: !12, line: 86, column: 8)
!142 = !DILocation(line: 89, column: 14, scope: !140)
!143 = !DILocalVariable(name: "source", scope: !144, file: !12, line: 92, type: !28)
!144 = distinct !DILexicalBlock(scope: !132, file: !12, line: 91, column: 5)
!145 = !DILocation(line: 92, column: 17, scope: !144)
!146 = !DILocalVariable(name: "i", scope: !147, file: !12, line: 94, type: !41)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 93, column: 9)
!148 = !DILocation(line: 94, column: 20, scope: !147)
!149 = !DILocation(line: 96, column: 20, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 96, column: 13)
!151 = !DILocation(line: 96, column: 18, scope: !150)
!152 = !DILocation(line: 96, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !12, line: 96, column: 13)
!154 = !DILocation(line: 96, column: 27, scope: !153)
!155 = !DILocation(line: 96, column: 13, scope: !150)
!156 = !DILocation(line: 98, column: 34, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !12, line: 97, column: 13)
!158 = !DILocation(line: 98, column: 27, scope: !157)
!159 = !DILocation(line: 98, column: 17, scope: !157)
!160 = !DILocation(line: 98, column: 22, scope: !157)
!161 = !DILocation(line: 98, column: 25, scope: !157)
!162 = !DILocation(line: 99, column: 13, scope: !157)
!163 = !DILocation(line: 96, column: 35, scope: !153)
!164 = !DILocation(line: 96, column: 13, scope: !153)
!165 = distinct !{!165, !155, !166, !65}
!166 = !DILocation(line: 99, column: 13, scope: !150)
!167 = !DILocation(line: 100, column: 31, scope: !147)
!168 = !DILocation(line: 100, column: 13, scope: !147)
!169 = !DILocation(line: 103, column: 1, scope: !132)
