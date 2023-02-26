; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %call = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !53
  %3 = load i32*, i32** %data, align 8, !dbg !54
  %call2 = call i64 @wcslen(i32* noundef %3), !dbg !55
  store i64 %call2, i64* %dataLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !60
  %5 = load i64, i64* %dataLen, align 8, !dbg !62
  %cmp = icmp ult i64 %4, %5, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !65
  %7 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !65
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !69
  store i32 %8, i32* %arrayidx4, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %10, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !77
  store i32 0, i32* %arrayidx5, align 4, !dbg !78
  %11 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* noundef %11), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* noundef null), !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 noundef %conv), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !106 {
entry:
  ret i32 1, !dbg !109
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !115
  store i32* %arraydecay, i32** %data, align 8, !dbg !116
  %call = call i32 @staticReturnsFalse(), !dbg !117
  %tobool = icmp ne i32 %call, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  br label %if.end, !dbg !122

if.else:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !123
  %call1 = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !125
  %1 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !133, metadata !DIExpression()), !dbg !134
  %3 = load i32*, i32** %data, align 8, !dbg !135
  %call2 = call i64 @wcslen(i32* noundef %3), !dbg !136
  store i64 %call2, i64* %dataLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !141
  %5 = load i64, i64* %dataLen, align 8, !dbg !143
  %cmp = icmp ult i64 %4, %5, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !146
  %7 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !146
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !146
  %9 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !150
  store i32 %8, i32* %arrayidx4, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %10, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !157
  store i32 0, i32* %arrayidx5, align 4, !dbg !158
  %11 = load i32*, i32** %data, align 8, !dbg !159
  call void @printWLine(i32* noundef %11), !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !162 {
entry:
  ret i32 0, !dbg !163
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !164 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !167, metadata !DIExpression()), !dbg !168
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !169
  store i32* %arraydecay, i32** %data, align 8, !dbg !170
  %call = call i32 @staticReturnsTrue(), !dbg !171
  %tobool = icmp ne i32 %call, 0, !dbg !171
  br i1 %tobool, label %if.then, label %if.end, !dbg !173

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !174
  %call1 = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !176
  %1 = load i32*, i32** %data, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !177
  store i32 0, i32* %arrayidx, align 4, !dbg !178
  br label %if.end, !dbg !179

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !180, metadata !DIExpression()), !dbg !182
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !182
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %i, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !185, metadata !DIExpression()), !dbg !186
  %3 = load i32*, i32** %data, align 8, !dbg !187
  %call2 = call i64 @wcslen(i32* noundef %3), !dbg !188
  store i64 %call2, i64* %dataLen, align 8, !dbg !189
  store i64 0, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !193
  %5 = load i64, i64* %dataLen, align 8, !dbg !195
  %cmp = icmp ult i64 %4, %5, !dbg !196
  br i1 %cmp, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !198
  %7 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !198
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !198
  %9 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !202
  store i32 %8, i32* %arrayidx4, align 4, !dbg !203
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !205
  %inc = add i64 %10, 1, !dbg !205
  store i64 %inc, i64* %i, align 8, !dbg !205
  br label %for.cond, !dbg !206, !llvm.loop !207

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !209
  store i32 0, i32* %arrayidx5, align 4, !dbg !210
  %11 = load i32*, i32** %data, align 8, !dbg !211
  call void @printWLine(i32* noundef %11), !dbg !212
  ret void, !dbg !213
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 39, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 40, column: 13, scope: !11)
!29 = !DILocation(line: 41, column: 12, scope: !11)
!30 = !DILocation(line: 41, column: 10, scope: !11)
!31 = !DILocation(line: 42, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!33 = !DILocation(line: 42, column: 8, scope: !11)
!34 = !DILocation(line: 45, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 43, column: 5)
!36 = !DILocation(line: 45, column: 9, scope: !35)
!37 = !DILocation(line: 46, column: 9, scope: !35)
!38 = !DILocation(line: 46, column: 21, scope: !35)
!39 = !DILocation(line: 47, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 49, type: !42)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 49, column: 17, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 50, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !50)
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 50, column: 16, scope: !41)
!52 = !DILocalVariable(name: "dataLen", scope: !41, file: !12, line: 50, type: !47)
!53 = !DILocation(line: 50, column: 19, scope: !41)
!54 = !DILocation(line: 51, column: 26, scope: !41)
!55 = !DILocation(line: 51, column: 19, scope: !41)
!56 = !DILocation(line: 51, column: 17, scope: !41)
!57 = !DILocation(line: 53, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !41, file: !12, line: 53, column: 9)
!59 = !DILocation(line: 53, column: 14, scope: !58)
!60 = !DILocation(line: 53, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 53, column: 9)
!62 = !DILocation(line: 53, column: 25, scope: !61)
!63 = !DILocation(line: 53, column: 23, scope: !61)
!64 = !DILocation(line: 53, column: 9, scope: !58)
!65 = !DILocation(line: 55, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !12, line: 54, column: 9)
!67 = !DILocation(line: 55, column: 28, scope: !66)
!68 = !DILocation(line: 55, column: 18, scope: !66)
!69 = !DILocation(line: 55, column: 13, scope: !66)
!70 = !DILocation(line: 55, column: 21, scope: !66)
!71 = !DILocation(line: 56, column: 9, scope: !66)
!72 = !DILocation(line: 53, column: 35, scope: !61)
!73 = !DILocation(line: 53, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 56, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 57, column: 9, scope: !41)
!78 = !DILocation(line: 57, column: 20, scope: !41)
!79 = !DILocation(line: 58, column: 20, scope: !41)
!80 = !DILocation(line: 58, column: 9, scope: !41)
!81 = !DILocation(line: 60, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_08_good", scope: !12, file: !12, line: 123, type: !13, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!83 = !DILocation(line: 125, column: 5, scope: !82)
!84 = !DILocation(line: 126, column: 5, scope: !82)
!85 = !DILocation(line: 127, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 139, type: !87, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!87 = !DISubroutineType(types: !88)
!88 = !{!22, !22, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !12, line: 139, type: !22)
!93 = !DILocation(line: 139, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !12, line: 139, type: !89)
!95 = !DILocation(line: 139, column: 27, scope: !86)
!96 = !DILocation(line: 142, column: 22, scope: !86)
!97 = !DILocation(line: 142, column: 12, scope: !86)
!98 = !DILocation(line: 142, column: 5, scope: !86)
!99 = !DILocation(line: 144, column: 5, scope: !86)
!100 = !DILocation(line: 145, column: 5, scope: !86)
!101 = !DILocation(line: 146, column: 5, scope: !86)
!102 = !DILocation(line: 149, column: 5, scope: !86)
!103 = !DILocation(line: 150, column: 5, scope: !86)
!104 = !DILocation(line: 151, column: 5, scope: !86)
!105 = !DILocation(line: 153, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !107, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!107 = !DISubroutineType(types: !108)
!108 = !{!22}
!109 = !DILocation(line: 27, column: 5, scope: !106)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 69, type: !17)
!112 = !DILocation(line: 69, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !12, line: 70, type: !25)
!114 = !DILocation(line: 70, column: 13, scope: !110)
!115 = !DILocation(line: 71, column: 12, scope: !110)
!116 = !DILocation(line: 71, column: 10, scope: !110)
!117 = !DILocation(line: 72, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !12, line: 72, column: 8)
!119 = !DILocation(line: 72, column: 8, scope: !110)
!120 = !DILocation(line: 75, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 73, column: 5)
!122 = !DILocation(line: 76, column: 5, scope: !121)
!123 = !DILocation(line: 80, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !12, line: 78, column: 5)
!125 = !DILocation(line: 80, column: 9, scope: !124)
!126 = !DILocation(line: 81, column: 9, scope: !124)
!127 = !DILocation(line: 81, column: 20, scope: !124)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !12, line: 84, type: !42)
!129 = distinct !DILexicalBlock(scope: !110, file: !12, line: 83, column: 5)
!130 = !DILocation(line: 84, column: 17, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !12, line: 85, type: !47)
!132 = !DILocation(line: 85, column: 16, scope: !129)
!133 = !DILocalVariable(name: "dataLen", scope: !129, file: !12, line: 85, type: !47)
!134 = !DILocation(line: 85, column: 19, scope: !129)
!135 = !DILocation(line: 86, column: 26, scope: !129)
!136 = !DILocation(line: 86, column: 19, scope: !129)
!137 = !DILocation(line: 86, column: 17, scope: !129)
!138 = !DILocation(line: 88, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !12, line: 88, column: 9)
!140 = !DILocation(line: 88, column: 14, scope: !139)
!141 = !DILocation(line: 88, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 88, column: 9)
!143 = !DILocation(line: 88, column: 25, scope: !142)
!144 = !DILocation(line: 88, column: 23, scope: !142)
!145 = !DILocation(line: 88, column: 9, scope: !139)
!146 = !DILocation(line: 90, column: 23, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !12, line: 89, column: 9)
!148 = !DILocation(line: 90, column: 28, scope: !147)
!149 = !DILocation(line: 90, column: 18, scope: !147)
!150 = !DILocation(line: 90, column: 13, scope: !147)
!151 = !DILocation(line: 90, column: 21, scope: !147)
!152 = !DILocation(line: 91, column: 9, scope: !147)
!153 = !DILocation(line: 88, column: 35, scope: !142)
!154 = !DILocation(line: 88, column: 9, scope: !142)
!155 = distinct !{!155, !145, !156, !76}
!156 = !DILocation(line: 91, column: 9, scope: !139)
!157 = !DILocation(line: 92, column: 9, scope: !129)
!158 = !DILocation(line: 92, column: 20, scope: !129)
!159 = !DILocation(line: 93, column: 20, scope: !129)
!160 = !DILocation(line: 93, column: 9, scope: !129)
!161 = !DILocation(line: 95, column: 1, scope: !110)
!162 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !107, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!163 = !DILocation(line: 32, column: 5, scope: !162)
!164 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!165 = !DILocalVariable(name: "data", scope: !164, file: !12, line: 100, type: !17)
!166 = !DILocation(line: 100, column: 15, scope: !164)
!167 = !DILocalVariable(name: "dataBuffer", scope: !164, file: !12, line: 101, type: !25)
!168 = !DILocation(line: 101, column: 13, scope: !164)
!169 = !DILocation(line: 102, column: 12, scope: !164)
!170 = !DILocation(line: 102, column: 10, scope: !164)
!171 = !DILocation(line: 103, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !164, file: !12, line: 103, column: 8)
!173 = !DILocation(line: 103, column: 8, scope: !164)
!174 = !DILocation(line: 106, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !12, line: 104, column: 5)
!176 = !DILocation(line: 106, column: 9, scope: !175)
!177 = !DILocation(line: 107, column: 9, scope: !175)
!178 = !DILocation(line: 107, column: 20, scope: !175)
!179 = !DILocation(line: 108, column: 5, scope: !175)
!180 = !DILocalVariable(name: "dest", scope: !181, file: !12, line: 110, type: !42)
!181 = distinct !DILexicalBlock(scope: !164, file: !12, line: 109, column: 5)
!182 = !DILocation(line: 110, column: 17, scope: !181)
!183 = !DILocalVariable(name: "i", scope: !181, file: !12, line: 111, type: !47)
!184 = !DILocation(line: 111, column: 16, scope: !181)
!185 = !DILocalVariable(name: "dataLen", scope: !181, file: !12, line: 111, type: !47)
!186 = !DILocation(line: 111, column: 19, scope: !181)
!187 = !DILocation(line: 112, column: 26, scope: !181)
!188 = !DILocation(line: 112, column: 19, scope: !181)
!189 = !DILocation(line: 112, column: 17, scope: !181)
!190 = !DILocation(line: 114, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !181, file: !12, line: 114, column: 9)
!192 = !DILocation(line: 114, column: 14, scope: !191)
!193 = !DILocation(line: 114, column: 21, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !12, line: 114, column: 9)
!195 = !DILocation(line: 114, column: 25, scope: !194)
!196 = !DILocation(line: 114, column: 23, scope: !194)
!197 = !DILocation(line: 114, column: 9, scope: !191)
!198 = !DILocation(line: 116, column: 23, scope: !199)
!199 = distinct !DILexicalBlock(scope: !194, file: !12, line: 115, column: 9)
!200 = !DILocation(line: 116, column: 28, scope: !199)
!201 = !DILocation(line: 116, column: 18, scope: !199)
!202 = !DILocation(line: 116, column: 13, scope: !199)
!203 = !DILocation(line: 116, column: 21, scope: !199)
!204 = !DILocation(line: 117, column: 9, scope: !199)
!205 = !DILocation(line: 114, column: 35, scope: !194)
!206 = !DILocation(line: 114, column: 9, scope: !194)
!207 = distinct !{!207, !197, !208, !76}
!208 = !DILocation(line: 117, column: 9, scope: !191)
!209 = !DILocation(line: 118, column: 9, scope: !181)
!210 = !DILocation(line: 118, column: 20, scope: !181)
!211 = !DILocation(line: 119, column: 20, scope: !181)
!212 = !DILocation(line: 119, column: 9, scope: !181)
!213 = !DILocation(line: 121, column: 1, scope: !164)
