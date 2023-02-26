; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_bad() #0 !dbg !11 {
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
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx2, align 1, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !56
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !56
  %4 = load i8*, i8** %data, align 8, !dbg !57
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !57
  store i8 %3, i8* %arrayidx4, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !66
  store i8 0, i8* %arrayidx5, align 1, !dbg !67
  %8 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* noundef %8), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !75 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_good(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_bad(), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay, i8** %data, align 8, !dbg !102
  %0 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  call void @llvm.dbg.declare(metadata i64* %i, metadata !105, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !110
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx2, align 1, !dbg !112
  store i64 0, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !116
  %cmp = icmp ult i64 %1, 100, !dbg !118
  br i1 %cmp, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !122
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  %5 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !123
  store i8 %3, i8* %arrayidx4, align 1, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !127
  %inc = add i64 %6, 1, !dbg !127
  store i64 %inc, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !131
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !131
  store i8 0, i8* %arrayidx5, align 1, !dbg !132
  %8 = load i8*, i8** %data, align 8, !dbg !133
  call void @printLine(i8* noundef %8), !dbg !134
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !136 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !143
  store i8* %arraydecay, i8** %data, align 8, !dbg !144
  %0 = load i8*, i8** %data, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !145
  store i8 0, i8* %arrayidx, align 1, !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !152
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !153
  store i8 0, i8* %arrayidx2, align 1, !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !158
  %cmp = icmp ult i64 %1, 100, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !164
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !164
  %4 = load i8*, i8** %data, align 8, !dbg !165
  %5 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !165
  store i8 %3, i8* %arrayidx4, align 1, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %6, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !173
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !173
  store i8 0, i8* %arrayidx5, align 1, !dbg !174
  %8 = load i8*, i8** %data, align 8, !dbg !175
  call void @printLine(i8* noundef %8), !dbg !176
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!30 = !DILocation(line: 33, column: 16, scope: !11)
!31 = !DILocation(line: 33, column: 14, scope: !11)
!32 = !DILocation(line: 34, column: 9, scope: !11)
!33 = !DILocation(line: 34, column: 17, scope: !11)
!34 = !DILocalVariable(name: "i", scope: !35, file: !12, line: 42, type: !36)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 31, baseType: !38)
!37 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !39, line: 94, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 42, column: 16, scope: !35)
!42 = !DILocalVariable(name: "source", scope: !35, file: !12, line: 43, type: !26)
!43 = !DILocation(line: 43, column: 14, scope: !35)
!44 = !DILocation(line: 44, column: 9, scope: !35)
!45 = !DILocation(line: 45, column: 9, scope: !35)
!46 = !DILocation(line: 45, column: 23, scope: !35)
!47 = !DILocation(line: 47, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !35, file: !12, line: 47, column: 9)
!49 = !DILocation(line: 47, column: 14, scope: !48)
!50 = !DILocation(line: 47, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 47, column: 9)
!52 = !DILocation(line: 47, column: 23, scope: !51)
!53 = !DILocation(line: 47, column: 9, scope: !48)
!54 = !DILocation(line: 49, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 48, column: 9)
!56 = !DILocation(line: 49, column: 23, scope: !55)
!57 = !DILocation(line: 49, column: 13, scope: !55)
!58 = !DILocation(line: 49, column: 18, scope: !55)
!59 = !DILocation(line: 49, column: 21, scope: !55)
!60 = !DILocation(line: 50, column: 9, scope: !55)
!61 = !DILocation(line: 47, column: 31, scope: !51)
!62 = !DILocation(line: 47, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 50, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 51, column: 9, scope: !35)
!67 = !DILocation(line: 51, column: 21, scope: !35)
!68 = !DILocation(line: 52, column: 19, scope: !35)
!69 = !DILocation(line: 52, column: 9, scope: !35)
!70 = !DILocation(line: 54, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_15_good", scope: !12, file: !12, line: 126, type: !13, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DILocation(line: 128, column: 5, scope: !71)
!73 = !DILocation(line: 129, column: 5, scope: !71)
!74 = !DILocation(line: 130, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 142, type: !76, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 142, type: !78)
!81 = !DILocation(line: 142, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 142, type: !79)
!83 = !DILocation(line: 142, column: 27, scope: !75)
!84 = !DILocation(line: 145, column: 22, scope: !75)
!85 = !DILocation(line: 145, column: 12, scope: !75)
!86 = !DILocation(line: 145, column: 5, scope: !75)
!87 = !DILocation(line: 147, column: 5, scope: !75)
!88 = !DILocation(line: 148, column: 5, scope: !75)
!89 = !DILocation(line: 149, column: 5, scope: !75)
!90 = !DILocation(line: 152, column: 5, scope: !75)
!91 = !DILocation(line: 153, column: 5, scope: !75)
!92 = !DILocation(line: 154, column: 5, scope: !75)
!93 = !DILocation(line: 156, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 63, type: !17)
!96 = !DILocation(line: 63, column: 12, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !12, line: 64, type: !21)
!98 = !DILocation(line: 64, column: 10, scope: !94)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !12, line: 65, type: !26)
!100 = !DILocation(line: 65, column: 10, scope: !94)
!101 = !DILocation(line: 74, column: 16, scope: !94)
!102 = !DILocation(line: 74, column: 14, scope: !94)
!103 = !DILocation(line: 75, column: 9, scope: !94)
!104 = !DILocation(line: 75, column: 17, scope: !94)
!105 = !DILocalVariable(name: "i", scope: !106, file: !12, line: 79, type: !36)
!106 = distinct !DILexicalBlock(scope: !94, file: !12, line: 78, column: 5)
!107 = !DILocation(line: 79, column: 16, scope: !106)
!108 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 80, type: !26)
!109 = !DILocation(line: 80, column: 14, scope: !106)
!110 = !DILocation(line: 81, column: 9, scope: !106)
!111 = !DILocation(line: 82, column: 9, scope: !106)
!112 = !DILocation(line: 82, column: 23, scope: !106)
!113 = !DILocation(line: 84, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !12, line: 84, column: 9)
!115 = !DILocation(line: 84, column: 14, scope: !114)
!116 = !DILocation(line: 84, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 84, column: 9)
!118 = !DILocation(line: 84, column: 23, scope: !117)
!119 = !DILocation(line: 84, column: 9, scope: !114)
!120 = !DILocation(line: 86, column: 30, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 85, column: 9)
!122 = !DILocation(line: 86, column: 23, scope: !121)
!123 = !DILocation(line: 86, column: 13, scope: !121)
!124 = !DILocation(line: 86, column: 18, scope: !121)
!125 = !DILocation(line: 86, column: 21, scope: !121)
!126 = !DILocation(line: 87, column: 9, scope: !121)
!127 = !DILocation(line: 84, column: 31, scope: !117)
!128 = !DILocation(line: 84, column: 9, scope: !117)
!129 = distinct !{!129, !119, !130, !65}
!130 = !DILocation(line: 87, column: 9, scope: !114)
!131 = !DILocation(line: 88, column: 9, scope: !106)
!132 = !DILocation(line: 88, column: 21, scope: !106)
!133 = !DILocation(line: 89, column: 19, scope: !106)
!134 = !DILocation(line: 89, column: 9, scope: !106)
!135 = !DILocation(line: 91, column: 1, scope: !94)
!136 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!137 = !DILocalVariable(name: "data", scope: !136, file: !12, line: 96, type: !17)
!138 = !DILocation(line: 96, column: 12, scope: !136)
!139 = !DILocalVariable(name: "dataBadBuffer", scope: !136, file: !12, line: 97, type: !21)
!140 = !DILocation(line: 97, column: 10, scope: !136)
!141 = !DILocalVariable(name: "dataGoodBuffer", scope: !136, file: !12, line: 98, type: !26)
!142 = !DILocation(line: 98, column: 10, scope: !136)
!143 = !DILocation(line: 103, column: 16, scope: !136)
!144 = !DILocation(line: 103, column: 14, scope: !136)
!145 = !DILocation(line: 104, column: 9, scope: !136)
!146 = !DILocation(line: 104, column: 17, scope: !136)
!147 = !DILocalVariable(name: "i", scope: !148, file: !12, line: 112, type: !36)
!148 = distinct !DILexicalBlock(scope: !136, file: !12, line: 111, column: 5)
!149 = !DILocation(line: 112, column: 16, scope: !148)
!150 = !DILocalVariable(name: "source", scope: !148, file: !12, line: 113, type: !26)
!151 = !DILocation(line: 113, column: 14, scope: !148)
!152 = !DILocation(line: 114, column: 9, scope: !148)
!153 = !DILocation(line: 115, column: 9, scope: !148)
!154 = !DILocation(line: 115, column: 23, scope: !148)
!155 = !DILocation(line: 117, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !148, file: !12, line: 117, column: 9)
!157 = !DILocation(line: 117, column: 14, scope: !156)
!158 = !DILocation(line: 117, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !12, line: 117, column: 9)
!160 = !DILocation(line: 117, column: 23, scope: !159)
!161 = !DILocation(line: 117, column: 9, scope: !156)
!162 = !DILocation(line: 119, column: 30, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 118, column: 9)
!164 = !DILocation(line: 119, column: 23, scope: !163)
!165 = !DILocation(line: 119, column: 13, scope: !163)
!166 = !DILocation(line: 119, column: 18, scope: !163)
!167 = !DILocation(line: 119, column: 21, scope: !163)
!168 = !DILocation(line: 120, column: 9, scope: !163)
!169 = !DILocation(line: 117, column: 31, scope: !159)
!170 = !DILocation(line: 117, column: 9, scope: !159)
!171 = distinct !{!171, !161, !172, !65}
!172 = !DILocation(line: 120, column: 9, scope: !156)
!173 = !DILocation(line: 121, column: 9, scope: !148)
!174 = !DILocation(line: 121, column: 21, scope: !148)
!175 = !DILocation(line: 122, column: 19, scope: !148)
!176 = !DILocation(line: 122, column: 9, scope: !148)
!177 = !DILocation(line: 124, column: 1, scope: !136)
