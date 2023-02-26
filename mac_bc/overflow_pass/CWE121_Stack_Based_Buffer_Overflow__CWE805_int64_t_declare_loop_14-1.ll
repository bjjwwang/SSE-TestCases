; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %0 = load i32, i32* @globalFive, align 4, !dbg !32
  %cmp = icmp eq i32 %0, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i64* %arraydecay, i64** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !54
  %cmp1 = icmp ult i64 %2, 100, !dbg !56
  br i1 %cmp1, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !60
  %4 = load i64, i64* %arrayidx, align 8, !dbg !60
  %5 = load i64*, i64** %data, align 8, !dbg !61
  %6 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !61
  store i64 %4, i64* %arrayidx2, align 8, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %7, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !70
  %9 = load i64, i64* %arrayidx3, align 8, !dbg !70
  call void @printLongLongLine(i64 noundef %9), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14_good() #0 !dbg !73 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = load i32, i32* @globalFive, align 4, !dbg !105
  %cmp = icmp ne i32 %0, 5, !dbg !107
  br i1 %cmp, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i64* %arraydecay, i64** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !124
  %cmp1 = icmp ult i64 %2, 100, !dbg !126
  br i1 %cmp1, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !130
  %4 = load i64, i64* %arrayidx, align 8, !dbg !130
  %5 = load i64*, i64** %data, align 8, !dbg !131
  %6 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !131
  store i64 %4, i64* %arrayidx2, align 8, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %7, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !139
  %9 = load i64, i64* %arrayidx3, align 8, !dbg !139
  call void @printLongLongLine(i64 noundef %9), !dbg !140
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = load i32, i32* @globalFive, align 4, !dbg !149
  %cmp = icmp eq i32 %0, 5, !dbg !151
  br i1 %cmp, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !153
  store i64* %arraydecay, i64** %data, align 8, !dbg !155
  br label %if.end, !dbg !156

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !157, metadata !DIExpression()), !dbg !159
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !162
  store i64 0, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !166
  %cmp1 = icmp ult i64 %2, 100, !dbg !168
  br i1 %cmp1, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !172
  %4 = load i64, i64* %arrayidx, align 8, !dbg !172
  %5 = load i64*, i64** %data, align 8, !dbg !173
  %6 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !173
  store i64 %4, i64* %arrayidx2, align 8, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %7, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !181
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !181
  %9 = load i64, i64* %arrayidx3, align 8, !dbg !181
  call void @printLongLongLine(i64 noundef %9), !dbg !182
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 26, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!34 = !DILocation(line: 26, column: 18, scope: !33)
!35 = !DILocation(line: 26, column: 8, scope: !11)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 27, column: 5)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 33, type: !28)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!42 = !DILocation(line: 33, column: 17, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 35, type: !45)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 34, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !48, line: 94, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 35, column: 20, scope: !44)
!51 = !DILocation(line: 37, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !12, line: 37, column: 13)
!53 = !DILocation(line: 37, column: 18, scope: !52)
!54 = !DILocation(line: 37, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 37, column: 13)
!56 = !DILocation(line: 37, column: 27, scope: !55)
!57 = !DILocation(line: 37, column: 13, scope: !52)
!58 = !DILocation(line: 39, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 38, column: 13)
!60 = !DILocation(line: 39, column: 27, scope: !59)
!61 = !DILocation(line: 39, column: 17, scope: !59)
!62 = !DILocation(line: 39, column: 22, scope: !59)
!63 = !DILocation(line: 39, column: 25, scope: !59)
!64 = !DILocation(line: 40, column: 13, scope: !59)
!65 = !DILocation(line: 37, column: 35, scope: !55)
!66 = !DILocation(line: 37, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 40, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 41, column: 31, scope: !44)
!71 = !DILocation(line: 41, column: 13, scope: !44)
!72 = !DILocation(line: 44, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_14_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DILocation(line: 107, column: 5, scope: !73)
!75 = !DILocation(line: 108, column: 5, scope: !73)
!76 = !DILocation(line: 109, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !78, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 121, type: !80)
!85 = !DILocation(line: 121, column: 14, scope: !77)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 121, type: !81)
!87 = !DILocation(line: 121, column: 27, scope: !77)
!88 = !DILocation(line: 124, column: 22, scope: !77)
!89 = !DILocation(line: 124, column: 12, scope: !77)
!90 = !DILocation(line: 124, column: 5, scope: !77)
!91 = !DILocation(line: 126, column: 5, scope: !77)
!92 = !DILocation(line: 127, column: 5, scope: !77)
!93 = !DILocation(line: 128, column: 5, scope: !77)
!94 = !DILocation(line: 131, column: 5, scope: !77)
!95 = !DILocation(line: 132, column: 5, scope: !77)
!96 = !DILocation(line: 133, column: 5, scope: !77)
!97 = !DILocation(line: 135, column: 5, scope: !77)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 53, type: !17)
!100 = !DILocation(line: 53, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !12, line: 54, type: !23)
!102 = !DILocation(line: 54, column: 13, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !12, line: 55, type: !28)
!104 = !DILocation(line: 55, column: 13, scope: !98)
!105 = !DILocation(line: 56, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !12, line: 56, column: 8)
!107 = !DILocation(line: 56, column: 18, scope: !106)
!108 = !DILocation(line: 56, column: 8, scope: !98)
!109 = !DILocation(line: 59, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !12, line: 57, column: 5)
!111 = !DILocation(line: 60, column: 5, scope: !110)
!112 = !DILocation(line: 64, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !12, line: 62, column: 5)
!114 = !DILocation(line: 64, column: 14, scope: !113)
!115 = !DILocalVariable(name: "source", scope: !116, file: !12, line: 67, type: !28)
!116 = distinct !DILexicalBlock(scope: !98, file: !12, line: 66, column: 5)
!117 = !DILocation(line: 67, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !12, line: 69, type: !45)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 68, column: 9)
!120 = !DILocation(line: 69, column: 20, scope: !119)
!121 = !DILocation(line: 71, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 71, column: 13)
!123 = !DILocation(line: 71, column: 18, scope: !122)
!124 = !DILocation(line: 71, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 71, column: 13)
!126 = !DILocation(line: 71, column: 27, scope: !125)
!127 = !DILocation(line: 71, column: 13, scope: !122)
!128 = !DILocation(line: 73, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !12, line: 72, column: 13)
!130 = !DILocation(line: 73, column: 27, scope: !129)
!131 = !DILocation(line: 73, column: 17, scope: !129)
!132 = !DILocation(line: 73, column: 22, scope: !129)
!133 = !DILocation(line: 73, column: 25, scope: !129)
!134 = !DILocation(line: 74, column: 13, scope: !129)
!135 = !DILocation(line: 71, column: 35, scope: !125)
!136 = !DILocation(line: 71, column: 13, scope: !125)
!137 = distinct !{!137, !127, !138, !69}
!138 = !DILocation(line: 74, column: 13, scope: !122)
!139 = !DILocation(line: 75, column: 31, scope: !119)
!140 = !DILocation(line: 75, column: 13, scope: !119)
!141 = !DILocation(line: 78, column: 1, scope: !98)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!143 = !DILocalVariable(name: "data", scope: !142, file: !12, line: 83, type: !17)
!144 = !DILocation(line: 83, column: 15, scope: !142)
!145 = !DILocalVariable(name: "dataBadBuffer", scope: !142, file: !12, line: 84, type: !23)
!146 = !DILocation(line: 84, column: 13, scope: !142)
!147 = !DILocalVariable(name: "dataGoodBuffer", scope: !142, file: !12, line: 85, type: !28)
!148 = !DILocation(line: 85, column: 13, scope: !142)
!149 = !DILocation(line: 86, column: 8, scope: !150)
!150 = distinct !DILexicalBlock(scope: !142, file: !12, line: 86, column: 8)
!151 = !DILocation(line: 86, column: 18, scope: !150)
!152 = !DILocation(line: 86, column: 8, scope: !142)
!153 = !DILocation(line: 89, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !12, line: 87, column: 5)
!155 = !DILocation(line: 89, column: 14, scope: !154)
!156 = !DILocation(line: 90, column: 5, scope: !154)
!157 = !DILocalVariable(name: "source", scope: !158, file: !12, line: 92, type: !28)
!158 = distinct !DILexicalBlock(scope: !142, file: !12, line: 91, column: 5)
!159 = !DILocation(line: 92, column: 17, scope: !158)
!160 = !DILocalVariable(name: "i", scope: !161, file: !12, line: 94, type: !45)
!161 = distinct !DILexicalBlock(scope: !158, file: !12, line: 93, column: 9)
!162 = !DILocation(line: 94, column: 20, scope: !161)
!163 = !DILocation(line: 96, column: 20, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !12, line: 96, column: 13)
!165 = !DILocation(line: 96, column: 18, scope: !164)
!166 = !DILocation(line: 96, column: 25, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !12, line: 96, column: 13)
!168 = !DILocation(line: 96, column: 27, scope: !167)
!169 = !DILocation(line: 96, column: 13, scope: !164)
!170 = !DILocation(line: 98, column: 34, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !12, line: 97, column: 13)
!172 = !DILocation(line: 98, column: 27, scope: !171)
!173 = !DILocation(line: 98, column: 17, scope: !171)
!174 = !DILocation(line: 98, column: 22, scope: !171)
!175 = !DILocation(line: 98, column: 25, scope: !171)
!176 = !DILocation(line: 99, column: 13, scope: !171)
!177 = !DILocation(line: 96, column: 35, scope: !167)
!178 = !DILocation(line: 96, column: 13, scope: !167)
!179 = distinct !{!179, !169, !180, !69}
!180 = !DILocation(line: 99, column: 13, scope: !164)
!181 = !DILocation(line: 100, column: 31, scope: !161)
!182 = !DILocation(line: 100, column: 13, scope: !161)
!183 = !DILocation(line: 103, column: 1, scope: !142)
